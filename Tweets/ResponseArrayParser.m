//
//  ResponseArrayParser.m
//  AnimationTransitionMVP
//
//  Created by Student on 13.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "ResponseArrayParser.h"
#import "ResponseParser.h"
#import "Deserializable.h"
#import "PropertyInfo.h"

@implementation ResponseArrayParser

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
    
    assert( [json isKindOfClass:[NSArray class]] );
    
    NSMutableArray *resultArray = [NSMutableArray new];
    
    NSArray<PropertyInfo *> *properties = [class deserializableProperties];
    ResponseParser *parser = [[ResponseParser alloc] init];
    
    for( NSDictionary *object in json )
    {
        result = [[class alloc] init];
        
        [properties enumerateObjectsUsingBlock:^(PropertyInfo *obj, NSUInteger idx, BOOL *stop)
         {
             NSString *propertyKey = obj.propertyName;
             id value = object[propertyKey];
             
             if( [value isKindOfClass:[NSDictionary class]] )
             {
                 id res = [parser parseResponse:value expectedClass:obj.classType];
                 [result setValue:res forKey:propertyKey];
             }
             else
             {
                 [result setValue:value forKey:propertyKey];
             }
         }];
        
        [resultArray addObject:result];
    }
    
    return resultArray;
}

@end
