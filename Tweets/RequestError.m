//
//  ErrorMessage.m
//  AnimationTransitionMVP
//
//  Created by  user on 25.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "RequestError.h"
#import "PropertyInfo.h"

@interface RequestError()

@property (nonatomic, copy, readwrite) NSString *message;

@end

@implementation RequestError
{
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
    [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(message)) type:[NSDictionary class]]
    ];
}

@end
