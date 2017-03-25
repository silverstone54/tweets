//
//  RestAPI.h
//  AnimationTransitionMVP
//
//  Created by User on 17.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestAPI : NSObject

@property (nonatomic, copy) void (^loadDataCompletionHandler)(id data);

@property (nonatomic, copy) void (^requestFailedHandler)(NSString *message);

- (instancetype)init;

- (void)loadDataFromAccount:(NSString *)account expectedClass:(Class)class;
- (void)loadMoreData:(long)maxID;
- (void)pullToRefresh:(long)sinceID;

@end
