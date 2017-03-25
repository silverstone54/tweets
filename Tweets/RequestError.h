//
//  ErrorMessage.h
//  AnimationTransitionMVP
//
//  Created by  user on 25.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deserializable.h"

@interface RequestError : NSObject<Deserializable>

@property (nonatomic, copy, readonly) NSString *message;

- (instancetype)init;

@end
