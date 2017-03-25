//
//  TweetUser.m
//  AnimationTransitionMVP
//
//  Created by  user on 20.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "TweetUser.h"

#import "PropertyInfo.h"

@interface TweetUser()

@property (nonatomic, copy, readwrite) NSString *screen_name;
@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, copy, readwrite) NSString *profile_image_url_https;

@end

@implementation TweetUser

- (instancetype)init
{
    self = [super init];
    return self;
}

+ (NSArray<NSString *> *)deserializableProperties
{
    return @
    [
     [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(screen_name)) type:[NSString class]],
     [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(name)) type:[NSString class]],
     [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(profile_image_url_https)) type:[NSString class]]
     ];
}

- (NSString *)profile_image_url_https
{
    _profile_image_url_https = [_profile_image_url_https stringByReplacingOccurrencesOfString:@"_normal" withString:@"_bigger"];
    
    return _profile_image_url_https;
}

@end
