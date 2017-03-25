//
//  Request.m
//  AnimationTransitionMVP
//
//  Created by User on 17.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "Request.h"
#import "RequestError.h"
#import "PropertyInfo.h"

@interface Request()

@property (nonatomic, strong, readwrite) RequestError *errors;
@property (nonatomic, copy, readwrite) NSString *error;
@property (nonatomic, copy, readwrite) NSString *access_token;

@end

@implementation Request
{
}

- (instancetype)init
{
    self = [super init];
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"error> %@\naccess_token> %@", _errors, _access_token];
}

+ (NSArray<PropertyInfo *> *)deserializableProperties
{
    return @
    [
     [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(errors)) type:[RequestError class]],
     [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(error)) type:[NSString class]],
     [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(access_token)) type:[NSString class]]
    ];
}

@end
