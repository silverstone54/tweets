//
//  FirstScreenPresenter.m
//  AnimationTranitionMVP
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "FirstScreenPresenter.h"
#import "FirstScreenUI.h"
#import "ScreenUIFactory.h"
#import "TweetsDataProvider.h"
#import "AppContext.h"

@implementation FirstScreenPresenter
{
    FirstScreenUI *screenUI;
    TweetsDataProvider *tweets;
}

- (instancetype)initWithAppContext:(AppContext *)context
{
    assert( nil != context );
    
    self = [super initWithAppContext:context];
    
    screenUI = [context.factory makeFirstScreenUI];
    
    tweets = context.tweetsDataProvider;
    
    [self initCompletions];
    
    return self;
}

- (void)initCompletions
{
    typeof(self) __weak weakSelf = self;
    
    screenUI.loadTweetsButtonClickHandler = ^(NSString *account)
    {
        [weakSelf handleLoadTweetsButtonClick:account];
    };
    
    tweets.loadingTweetsCompletionHandler = ^
    {
        [weakSelf handleLoadingTweets];
    };
    tweets.requestFailedHandler = ^(NSString *message)
    {
        [weakSelf handleFailedRequest:message];
    };
}

- (void)handleLoadTweetsButtonClick:(NSString *)account
{
    [tweets loadTweetsFromAccount:account];
    
    [screenUI showActivityIndicator];
}

- (void)handleLoadingTweets
{
    dispatch_async(dispatch_get_main_queue(), ^
    {
        [screenUI hideActivityIndicator];
    });
    
    if( NULL != _loadedDataCompletionHandler )
    {
        dispatch_async(dispatch_get_main_queue(), ^
        {
            _loadedDataCompletionHandler();
        });
    }
}

- (void)handleFailedRequest:(NSString *)message
{
    if( NULL != _showAlertHandler )
    {
        dispatch_async(dispatch_get_main_queue(), ^
        {
            [screenUI hideActivityIndicator];
            _showAlertHandler(message);
        });
    }
}

- (id<IBaseScreenUI>)screenUI
{
    return screenUI;
}

@end
