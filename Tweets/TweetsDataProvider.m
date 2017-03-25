//
//  Tweets.m
//  AnimationTransitionMVP
//
//  Created by  user on 12.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "TweetsDataProvider.h"

#import "Tweet.h"
#import "TweetUser.h"
#import "TweetRetweeted.h"
#import "TweetEntities.h"
#import "TweetMedia.h"

#import "Downloader.h"
#import "RestAPI.h"

@implementation TweetsDataProvider
{
    RestAPI *restAPI;
    Downloader *downloader;
    
    NSString *account;
    
    NSMutableArray *dataArray;
    
    BOOL isPullToRefresh;
}

NSString *const ACCOUNT = @"chucknorris";

- (instancetype)init
{
    self = [super init];
    
    restAPI = [[RestAPI alloc] init];
    
    downloader = [[Downloader alloc] init];
    
    [self initCompletions];
    
    isPullToRefresh = NO;

    return self;
}

- (void)initCompletions
{
    typeof(self) __weak weakSelf = self;
    
    restAPI.requestFailedHandler = ^(NSString *errorMessage)
    {
        [weakSelf handleRequestFailed:errorMessage];
    };
    restAPI.loadDataCompletionHandler = ^(id data)
    {
        [weakSelf handleLoadData:data];
    };
}

- (void)loadTweetsFromAccount:(NSString *)accountName
{
    if( accountName.length == 0 )
    {
        accountName = ACCOUNT;
    }
    
    if( [accountName isEqualToString:account] )
    {
        if( NULL != _loadingTweetsCompletionHandler )
        {
            _loadingTweetsCompletionHandler();
        }
    }
    else
    {
        account = accountName;
        
        // если запросили данные для другого аккаунта
        dataArray = nil;
        [Tweet resetProfileImage];
        
        [restAPI loadDataFromAccount:account expectedClass:[Tweet class]];
    }
}

- (void)handleRequestFailed:(NSString *)message
{
    NSLog(@"request failed> %@", message);
    if( NULL != _requestFailedHandler )
    {
        _requestFailedHandler(message);
    }
}

- (void)handleLoadData:(id)data
{
    assert( [data isKindOfClass:[NSArray class]] );
    
    if( nil == dataArray )
    {
        dataArray = [[NSMutableArray alloc] init];
    }

    NSUInteger firstIndex = dataArray.count;
    NSUInteger lastIndex;
    
    if( NO == isPullToRefresh )
    {
        [dataArray addObjectsFromArray:data];
        
        lastIndex = dataArray.count;
    }
    else
    {
        isPullToRefresh = NO;
        
        NSUInteger count = dataArray.count;

        [data addObjectsFromArray:dataArray];
        dataArray = data;
        
        firstIndex = 0;
        lastIndex = dataArray.count - count;
    }
    
    if( dataArray.count > 0 )
    {
        for( NSUInteger i = firstIndex; i < lastIndex; i++ )
        {
            Tweet *tweet = dataArray[i];
            if( nil != tweet.retweeted_status )
            {
                [downloader downloadImageWithURL:tweet.retweeted_status.user.profile_image_url_https completion:^(UIImage *image)
                 {
                     [tweet.retweeted_status assignRetweetProfileImage:image];
                     
                     if( NULL != _reloadRowAtIndexCompletionHandler )
                     {
                         dispatch_async(dispatch_get_main_queue(), ^
                         {
                             _reloadRowAtIndexCompletionHandler(i);
                         });
                     }
                }];
            }
        }
        
        Tweet *tweet = dataArray.firstObject;
        if( nil == tweet.profile_image )
        {
            [downloader downloadImageWithURL:tweet.user.profile_image_url_https completion:^(UIImage *image)
             {
                 [tweet assignProfileImage:image];
                 
                 if( NULL != _loadingTweetsCompletionHandler )
                 {
                     _loadingTweetsCompletionHandler();
                 }
             }];
        }
        else
        {
            if( NULL != _loadMoreTweetsCompletionHandler )
            {
                _loadMoreTweetsCompletionHandler();
            }
        }
    }
    else
    {
        if( NULL != _requestFailedHandler )
        {
            _requestFailedHandler(@"User has no tweets.");
        }
    }
}

- (void)loadMoreTweets
{
    Tweet *tweet = dataArray.lastObject;
    long maxID = [tweet.id longValue] - 1;
    
    [restAPI loadMoreData:maxID];
}

- (void)pullToRefresh
{
    isPullToRefresh = YES;
    
    Tweet *tweet = dataArray.firstObject;
    long sinceID = [tweet.id longValue];
    
    [restAPI pullToRefresh:sinceID];
}

- (void)loadImageAtIndex:(NSInteger)index
{
    Tweet *tweet = dataArray[index];
    if( nil != tweet.entities.media )
    {
        [downloader downloadImageWithURL:tweet.entities.media.media_url_https completion:^(UIImage *image)
         {
             [tweet.entities.media assignMediaImage:image];
             
             if( NULL != _reloadRowAtIndexCompletionHandler )
             {
                 dispatch_async(dispatch_get_main_queue(), ^
                 {
                     _reloadRowAtIndexCompletionHandler(index);
                 });
             }
         }];
    }
}

- (NSArray *)dataArray
{
    return [dataArray copy];
}

@end
