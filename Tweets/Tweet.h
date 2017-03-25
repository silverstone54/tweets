//
//  Tweet.h
//  AnimationTransitionMVP
//
//  Created by Student on 13.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Deserializable.h"

@class TweetUser;
@class TweetRetweeted;
@class TweetEntities;
@class TweetExtendedEntities;

@interface Tweet : NSObject<Deserializable>

@property (nonatomic, strong, readonly) TweetUser *user;
@property (nonatomic, strong, readonly) TweetRetweeted *retweeted_status;
@property (nonatomic, strong, readonly) TweetEntities *entities;
@property (nonatomic, strong, readonly) TweetExtendedEntities *extended_entities;

@property (nonatomic, copy, readonly) NSString *created_at;
@property (nonatomic, copy, readonly) NSNumber *id;
@property (nonatomic, copy, readonly) NSString *text;
@property (nonatomic, copy, readonly) NSNumber *favorite_count;
@property (nonatomic, copy, readonly) NSNumber *retweet_count;

@property (nonatomic, strong, readonly) UIImage *profile_image;

- (instancetype)init;

+ (void)resetProfileImage;

- (NSString *)url;
- (void)assignProfileImage:(UIImage *)image;

@end
