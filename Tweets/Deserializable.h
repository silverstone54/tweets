//
//  Deserializable.h
//  AnimationTransitionMVP
//
//  Created by Student on 10.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PropertyInfo;

@protocol Deserializable<NSObject>

+ (NSArray<PropertyInfo *> *)deserializableProperties;

@end
