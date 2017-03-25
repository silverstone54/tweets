//
//  Tweet.m
//  AnimationTransitionMVP
//
//  Created by Student on 13.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "Tweet.h"
#import "TweetUser.h"
#import "TweetRetweeted.h"
#import "TweetEntities.h"
#import "TweetUrls.h"
#import "TweetExtendedEntities.h"
#import "TweetMedia.h"

#import "PropertyInfo.h"

@interface Tweet()

@property (nonatomic, strong, readwrite) TweetUser *user;
@property (nonatomic, strong, readwrite) TweetRetweeted *retweeted_status;
@property (nonatomic, strong, readwrite) TweetEntities *entities;
@property (nonatomic, strong, readwrite) TweetExtendedEntities *extended_entities;

@property (nonatomic, copy, readwrite) NSString *created_at;
@property (nonatomic, copy, readwrite) NSNumber *id;
@property (nonatomic, copy, readwrite) NSString *text;
@property (nonatomic, copy, readwrite) NSNumber *favorite_count;
@property (nonatomic, copy, readwrite) NSNumber *retweet_count;

@end

@implementation Tweet
{
    BOOL onceDateConvert;
    BOOL onceRemoveURL;
}

UIImage *profileImage;

- (instancetype)init
{
    self = [super init];
    
    onceDateConvert = NO;
    onceRemoveURL = NO;
    
    return self;
}

+ (NSArray<NSString *> *)deserializableProperties
{
    return @
    [
     [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(user)) type:[TweetUser class]],
     [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(retweeted_status)) type:[TweetRetweeted class]],
     [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(entities)) type:[TweetEntities class]],
     [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(extended_entities)) type:[TweetExtendedEntities class]],
     [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(created_at)) type:[NSString class]],
     [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(id)) type:[NSNumber class]],
     [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(text)) type:[NSString class]],
     [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(favorite_count)) type:[NSNumber class]],
     [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(retweet_count)) type:[NSNumber class]]
     ];
}

+ (void)resetProfileImage
{
    profileImage = nil;
}

- (NSString *)url
{
    if( nil != _retweeted_status && nil != _retweeted_status.entities.urls )
    {
        return _retweeted_status.entities.urls.url;
    }
    if( nil != _extended_entities )
    {
        return _extended_entities.media.url;
    }
    if( nil != _entities.urls )
    {
        return _entities.urls.url;
    }
    
    return nil;
}

- (void)assignProfileImage:(UIImage *)image
{
    profileImage = image;
}

- (UIImage *)profile_image
{
    return profileImage;
}

- (NSString *)created_at
{
    if( NO == onceDateConvert )
    {
        onceDateConvert = YES;
        
        _created_at = [self retrievePostTime:_created_at];
    }
    
    return _created_at;
}

- (NSString *)retrievePostTime:(NSString *)postDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
    NSDate *userPostDate = [dateFormatter dateFromString:postDate];
    
    NSDate *currentDate = [NSDate date];
    NSTimeInterval distanceBetweenDates = [currentDate timeIntervalSinceDate:userPostDate];
    
    NSTimeInterval theTimeInterval = distanceBetweenDates;
    
    NSCalendar *sysCalendar = [NSCalendar currentCalendar];
    
    NSDate *date1 = [[NSDate alloc] init];
    NSDate *date2 = [[NSDate alloc] initWithTimeInterval:theTimeInterval sinceDate:date1];
    
    unsigned int unitFlags = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitSecond;
    
    NSDateComponents *conversionInfo = [sysCalendar components:unitFlags fromDate:date1  toDate:date2  options:0];
    
    NSString *resultDate;
    if( [conversionInfo month] > 0 )
    {
        resultDate = [NSString stringWithFormat:@"%ldmth ago", (long)[conversionInfo month]];
    }
    else if( [conversionInfo day] > 0 )
    {
        resultDate = [NSString stringWithFormat:@"%ldd ago", (long)[conversionInfo day]];
    }
    else if( [conversionInfo hour] > 0 )
    {
        resultDate = [NSString stringWithFormat:@"%ldh ago", (long)[conversionInfo hour]];
    }
    else if( [conversionInfo minute] > 0 )
    {
        resultDate = [NSString stringWithFormat:@"%ldm ago", (long)[conversionInfo minute]];
    }
    else
    {
        resultDate = [NSString stringWithFormat:@"%lds ago", (long)[conversionInfo second]];
    }
    
    return resultDate;
}

- (NSString *)text
{
    if( NO == onceRemoveURL && nil != _entities.urls )
    {
        onceRemoveURL = YES;
        
        _text = [_text stringByReplacingOccurrencesOfString:_entities.urls.url withString:@""];
        
        if( nil != _extended_entities )
        {
            _text = [_text stringByReplacingOccurrencesOfString:_extended_entities.media.url withString:@""];
        }
    }
    
    return _text;
}

@end
