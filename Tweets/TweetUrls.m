//
//  TweetUrls.m
//  AnimationTransitionMVP
//
//  Created by Student on 25.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "TweetUrls.h"

#import "PropertyInfo.h"

@interface TweetUrls()

@property (nonatomic, copy, readwrite) NSString *url;

@end

@implementation TweetUrls

- (instancetype)init
{
    self = [super init];
    return self;
}

+ (NSArray<PropertyInfo *> *)deserializableProperties
{
    return @
    [
     [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(url)) type:[NSString class]]
     ];
}

@end
