//
//  AppContext.m
//  AnimationTransitionMVP
//
//  Created by Student on 20.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "AppContext.h"
#import "TweetsDataProvider.h"
#import "ScreenUIFactory.h"

@implementation AppContext
{
    ScreenUIFactory *factory;
    TweetsDataProvider *tweetsDataProvider;
}

- (instancetype)init
{
    self = [super init];
    
    factory = [[ScreenUIFactory alloc] init];
    tweetsDataProvider = [[TweetsDataProvider alloc] init];
    
    return self;
}

- (ScreenUIFactory *)factory
{
    return factory;
}

- (TweetsDataProvider *)tweetsDataProvider
{
    return tweetsDataProvider;
}

@end
