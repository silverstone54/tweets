//
//  TweetEntities.m
//  AnimationTransitionMVP
//
//  Created by Student on 22.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "TweetEntities.h"
#import "TweetMedia.h"
#import "TweetUrls.h"

#import "PropertyInfo.h"

@interface TweetEntities()

@property (nonatomic, strong, readwrite) TweetMedia *media;
@property (nonatomic, strong, readwrite) TweetUrls *urls;

@end

@implementation TweetEntities

- (instancetype)init
{
    self = [super init];
    return self;
}

+ (NSArray<PropertyInfo *> *)deserializableProperties
{
    return @
    [
     [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(media)) type:[TweetMedia class]],
     [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(urls)) type:[TweetUrls class]]
     ];
}

@end
