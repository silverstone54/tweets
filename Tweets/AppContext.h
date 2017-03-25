//
//  AppContext.h
//  AnimationTransitionMVP
//
//  Created by Student on 20.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TweetsDataProvider;
@class ScreenUIFactory;

@interface AppContext : NSObject

@property (nonatomic, strong, readonly) ScreenUIFactory *factory;
@property (nonatomic, strong, readonly) TweetsDataProvider *tweetsDataProvider;

- (instancetype)init;

@end
