//
//  RestAPI.m
//  AnimationTransitionMVP
//
//  Created by User on 17.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "RestAPI.h"
#import "Network.h"
#import "RequestContext.h"
#import "Request.h"
#import "RequestError.h"

@implementation RestAPI
{
    Network *network;
    
    NSString *resultURL;
    NSString *tokenBase64;
    NSDictionary *httpHeader;
    NSData *httpBodyBase64;
    
    NSString *accountName;
    
    Class expectedClass;
}

const NSUInteger COUNT = 10;

NSString *const CONSUMER_KEY = @"kcTSCPcKHoUqC7Sn1BCCS4YjE";
NSString *const CONSUMER_SECRET = @"2zsSuDJDRmcSC8dTjne7p54JJitPbwm9o7bXhA5Os6HnGwGFC3";

NSString *const POST = @"POST";
NSString *const GET = @"GET";

NSString *const AUTH = @"Authorization";
NSString *const BASIC = @"Basic";
NSString *const BEARER = @"Bearer";

NSString *const BASE_URL = @"https://api.twitter.com";

NSString *const AUTH_TOKEN = @"/oauth2/token?oauth_token=";
NSString *const HTTP_BODY = @"grant_type=client_credentials";

NSString *const USER_URL = @"/1.1/statuses/user_timeline.json?";
NSString *const REQUEST_ACCOUNT = @"screen_name=";
NSString *const REQUEST_COUNT = @"&count=";
NSString *const REQUEST_MAX_ID = @"&max_id=";
NSString *const REQUEST_SINCE_ID = @"&since_id=";

- (instancetype)init
{
    self = [super init];
    return self;
}

- (void)loadDataFromAccount:(NSString *)account expectedClass:(Class)class
{
    accountName = account;
    expectedClass = class;
    
    [self authorization];
}

#pragma mark Authorization
- (void)authorization
{
    [self makeAuthHTTPRequest];
    [self authRequest];
}

- (void)makeAuthHTTPRequest
{
    [self makeToken];
    
    resultURL = [NSString stringWithFormat:@"%@%@%@", BASE_URL, AUTH_TOKEN, tokenBase64];
    httpHeader = @{AUTH : [NSString stringWithFormat:@"%@ %@", BASIC, tokenBase64]};
    httpBodyBase64 = [HTTP_BODY dataUsingEncoding:NSUTF8StringEncoding];
}

- (void)makeToken
{
    NSString *consumerToken = [NSString stringWithFormat:@"%@:%@", CONSUMER_KEY, CONSUMER_SECRET];
    [self encodeToken:consumerToken];
}

- (void)encodeToken:(NSString *)token
{
    NSData *data = [token dataUsingEncoding:NSUTF8StringEncoding];
    tokenBase64 = [data base64EncodedStringWithOptions:0];
}

- (void)authRequest
{
    network = [[Network alloc] init];
    RequestContext *context = [[RequestContext alloc] initWithURL:resultURL method:POST header:httpHeader body:httpBodyBase64 expectedClass:[Request class]];
    
    typeof(self) __weak weakSelf = self;
    
    [network requestWithContext:context completion:^(NSError *error, id data)
     {
         if( nil != error )
         {
             if( NULL != _requestFailedHandler )
             {
                 _requestFailedHandler(error.localizedDescription);
             }
         }
         else
         {
             [weakSelf handleAuthData:data];
         }
     }];
}

- (void)handleAuthData:(id)data
{
    NSLog(@"%@", data);
    Request *request = data;
    
    if( nil != request.errors )
    {
        if( NULL != _requestFailedHandler )
        {
            _requestFailedHandler(request.errors.message);
        }
    }
    else
    {
        tokenBase64 = request.access_token;
        
        [self makeContentHTTPRequest];
        [self contentRequest];
    }
}

#pragma mark Content request
- (void)makeContentHTTPRequest
{
    NSString *requestParam = [NSString stringWithFormat:@"%@%@%@%ld", REQUEST_ACCOUNT, accountName, REQUEST_COUNT, COUNT];
    resultURL = [NSString stringWithFormat:@"%@%@%@", BASE_URL, USER_URL, requestParam];
    httpHeader = @{AUTH : [NSString stringWithFormat:@"%@ %@", BEARER, tokenBase64]};
}

- (void)contentRequest
{
    RequestContext *context = [[RequestContext alloc] initWithURL:resultURL method:GET header:httpHeader body:nil expectedClass:expectedClass];

    typeof(self) __weak weakSelf = self;

    [network requestWithContext:context completion:^(NSError *error, id data)
     {
         if( nil != error )
         {
             if( NULL != _requestFailedHandler )
             {
                 _requestFailedHandler(error.localizedDescription);
             }
         }
         else if( [data isKindOfClass:[Request class]] )
         {
             Request *request = data;
             NSString *errorMessage = request.errors.message != nil ? request.errors.message : request.error;
             
             if( NULL != _requestFailedHandler )
             {
                 _requestFailedHandler(errorMessage);
             }
         }
         else
         {
             [weakSelf handleContentRequest:data];
         }
     }];
}

- (void)handleContentRequest:(id)data
{
    if( NULL != _loadDataCompletionHandler )
    {
        _loadDataCompletionHandler(data);
    }
}

#pragma mark Load more data
- (void)loadMoreData:(long)maxID
{
    [self makeContentHTTPRequest];
    resultURL = [NSString stringWithFormat:@"%@%@%ld", resultURL, REQUEST_MAX_ID, maxID];

    [self contentRequest];
}

- (void)pullToRefresh:(long)sinceID
{
    [self makeContentHTTPRequest];
    resultURL = [NSString stringWithFormat:@"%@%@%ld", resultURL, REQUEST_SINCE_ID, sinceID];
    
    [self contentRequest];
}

@end
