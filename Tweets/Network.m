//
//  Network.m
//  AnimationTransitionMVP
//
//  Created by Student on 10.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "Network.h"
#import "RequestContext.h"
#import "Request.h"
#import "Parser.h"
#import "ResponseParser.h"
#import "ResponseArrayParser.h"

@implementation Network
{
    NSURLSession *session;
    
    Class expectedClass;
}

extern NSString *const AUTH;

- (instancetype)init
{
    self = [super init];
    
    return self;
}

- (void)requestWithContext:(RequestContext *)context completion:(NetworkHandler)completion
{
    expectedClass = context.expectedClass;
    
    [self makeSession];
    
    NSMutableURLRequest *request = [self makeRequestWithContext:context];

    NSURLSessionTask *task = [self makeTaskWithRequest:request completion:completion];
    [task resume];
}

- (void)makeSession
{
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    session = [NSURLSession sessionWithConfiguration:config];
}

- (NSMutableURLRequest *)makeRequestWithContext:(RequestContext *)context
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    request.URL = [NSURL URLWithString:context.url];
    request.HTTPMethod = context.httpMethod;
    [request setValue:context.httpHeader[AUTH] forHTTPHeaderField:AUTH];
    request.HTTPBody = context.httpBody;
    
    return request;
}

- (NSURLSessionTask *)makeTaskWithRequest:(NSURLRequest *)request completion:(NetworkHandler)completion
{
    typeof(self) __weak weakSelf = self;
    
    NSURLSessionTask *task;
    task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
            {
                if( nil != error )
                {
                    completion(error, nil);
                    return;
                }
                
                [weakSelf parseData:data completion:completion];
            }];
    
    return task;
}

- (void)parseData:(NSData *)data completion:(NetworkHandler)completion
{
    NSError *error = nil;
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    if( nil != error )
    {
        completion(error, nil);
        return;
    }
    
    if( [json isKindOfClass:[NSArray class]] )
    {
        _responseParser = [[ResponseArrayParser alloc] init];
        completion(nil, [_responseParser parseResponse:json expectedClass:expectedClass]);
    }
    else
    {
        _responseParser = [[ResponseParser alloc] init];
        completion(nil, [_responseParser parseResponse:json expectedClass:[Request class]]);
    }
}

@end
