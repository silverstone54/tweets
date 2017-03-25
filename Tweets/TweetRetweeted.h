//
//  TweetRetweeted.h
//  AnimationTransitionMVP
//
//  Created by User on 21.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Deserializable.h"

@class TweetUser;
@class TweetEntities;

@interface TweetRetweeted : NSObject<Deserializable>

@property (nonatomic, strong, readonly) TweetUser *user;
@property (nonatomic, strong, readonly) TweetEntities *entities;

@property (nonatomic, copy, readonly) NSNumber *favorite_count;
@property (nonatomic, copy, readonly) NSNumber *retweet_count;

@property (nonatomic, strong, readonly) UIImage *retweetProfileImage;

- (instancetype)init;

- (void)assignRetweetProfileImage:(UIImage *)image;

@end
