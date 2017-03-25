//
//  PropertyInfo.h
//  AnimationTransitionMVP
//
//  Created by Student on 20.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PropertyInfo : NSObject

@property (nonatomic, copy, readonly) NSString *propertyName;
@property (nonatomic, strong, readonly) Class classType;

- (instancetype)initWithProperty:(NSString *)property type:(Class)classType;

- (instancetype)init NS_UNAVAILABLE;

@end
