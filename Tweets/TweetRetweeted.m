//
//  TweetRetweeted.m
//  AnimationTransitionMVP
//
//  Created by User on 21.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "TweetRetweeted.h"
#import "TweetUser.h"
#import "TweetEntities.h"

#import "PropertyInfo.h"

@interface TweetRetweeted()

@property (nonatomic, strong, readwrite) TweetUser *user;
@property (nonatomic, strong, readwrite) TweetEntities *entities;

@property (nonatomic, copy, readwrite) NSNumber *favorite_count;
@property (nonatomic, copy, readwrite) NSNumber *retweet_count;

@end

@implementation TweetRetweeted
{
    UIImage *retweetProfileImage;
}

- (instancetype)init
{
    self = [super init];
    return self;
}

+ (NSArray<PropertyInfo *> *)deserializableProperties
{
    return @
    [
     [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(user)) type:[TweetUser class]],
     [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(entities)) type:[TweetEntities class]],
     [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(favorite_count)) type:[NSNumber class]],
     [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(retweet_count)) type:[NSNumber class]]
     ];
}

- (void)assignRetweetProfileImage:(UIImage *)image
{
    retweetProfileImage = image;
}

- (UIImage *)retweetProfileImage
{
    return retweetProfileImage;
}

@end
