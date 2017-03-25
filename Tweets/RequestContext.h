//
//  RequestContext.h
//  AnimationTransitionMVP
//
//  Created by Student on 10.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestContext : NSObject

@property (nonatomic, copy, readonly) NSString *url;
@property (nonatomic, copy, readonly) NSString *httpMethod;
@property (nonatomic, copy, readonly) NSDictionary *httpHeader;
@property (nonatomic, copy, readonly) NSData *httpBody;
@property (nonatomic, strong, readonly) Class expectedClass;

- (instancetype)initWithURL:(NSString *)url method:(NSString *)method header:(NSDictionary *)header body:(NSData *)body expectedClass:(Class)class;

- (instancetype)init NS_UNAVAILABLE;

@end
