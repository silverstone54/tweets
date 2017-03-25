//
//  ResponseParser.m
//  AnimationTransitionMVP
//
//  Created by Student on 10.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "ResponseParser.h"
#import "Deserializable.h"
#import "PropertyInfo.h"

@implementation ResponseParser

- (instancetype)init
{
    self = [super init];
    return self;
}

- (id)parseResponse:(id)json expectedClass:(Class)class
{
    id result = [[class alloc] init];
    
    if( NO == [result conformsToProtocol:@protocol(Deserializable)] )
    {
        assert( NO );
        return nil;
    }
    
    NSArray<PropertyInfo *> *properties = [class deserializableProperties];
    
    assert( [json isKindOfClass:[NSDictionary class]] );
    
    [properties enumerateObjectsUsingBlock:^(PropertyInfo *obj, NSUInteger idx, BOOL *stop)
     {
         NSString *propertyKey = obj.propertyName;
         id value = json[propertyKey];
         
         if( [value isKindOfClass:[NSDictionary class]] )
         {
             id res = [self parseResponse:value expectedClass:obj.classType];
             [result setValue:res forKey:propertyKey];
         }
         else if( [value isKindOfClass:[NSArray class]] )
         {
             NSArray *array = value;
             if( array.count > 0 )
             {
                 id res = [self parseResponse:array.lastObject expectedClass:obj.classType];
                 [result setValue:res forKey:propertyKey];
             }
         }
         else
         {
             [result setValue:value forKey:propertyKey];
         }
     }];
    
    return result;
}

@end
