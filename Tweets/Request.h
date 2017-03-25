//
//  Request.h
//  AnimationTransitionMVP
//
//  Created by User on 17.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deserializable.h"

@class RequestError;

@interface Request : NSObject<Deserializable>

@property (nonatomic, strong, readonly) RequestError *errors;
@property (nonatomic, copy, readonly) NSString *error;
@property (nonatomic, copy, readonly) NSString *access_token;

- (instancetype)init;

@end
