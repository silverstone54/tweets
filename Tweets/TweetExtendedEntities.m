//
//  TweetExtendedEntities.m
//  AnimationTransitionMVP
//
//  Created by  user on 26.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "TweetExtendedEntities.h"
#import "TweetMedia.h"

#import "PropertyInfo.h"

@interface TweetExtendedEntities()

@property (nonatomic, strong, readwrite) TweetMedia *media;

@end

@implementation TweetExtendedEntities

- (instancetype)init
{
    self = [super init];
    return self;
}

+ (NSArray<PropertyInfo *> *)deserializableProperties
{
    return @
    [
     [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(media)) type:[TweetMedia class]]
     ];
}

@end
