//
//  PropertyInfo.m
//  AnimationTransitionMVP
//
//  Created by Student on 20.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "PropertyInfo.h"

@interface PropertyInfo()

@property (nonatomic, copy, readwrite) NSString *propertyName;
@property (nonatomic, strong, readwrite) Class classType;

@end

@implementation PropertyInfo

- (instancetype)initWithProperty:(NSString *)property type:(Class)classType
{
    self = [super init];
    
    _propertyName = property;
    _classType = classType;
    
    return self;
}

@end
