//
//  RequestContext.m
//  AnimationTransitionMVP
//
//  Created by Student on 10.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "RequestContext.h"

@implementation RequestContext

- (instancetype)initWithURL:(NSString *)url method:(NSString *)method header:(NSDictionary *)header body:(NSData *)body expectedClass:(Class)class
{
    self = [super init];
    
    _url = [url copy];
    _httpMethod = [method copy];
    _httpHeader = [header copy];
    _httpBody = [body copy];
    _expectedClass = class;
    
    return self;
}

- (instancetype)init
{
    assert( NO );
    return nil;
}

@end
