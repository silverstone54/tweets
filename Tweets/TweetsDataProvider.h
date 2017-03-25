//
//  Tweets.h
//  AnimationTransitionMVP
//
//  Created by  user on 12.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TweetsDataProvider : NSObject

@property (nonatomic, copy) void (^loadingTweetsCompletionHandler)(void);
@property (nonatomic, copy) void (^loadMoreTweetsCompletionHandler)(void);
@property (nonatomic, copy) void (^reloadRowAtIndexCompletionHandler)(NSInteger index);

@property (nonatomic, copy) void (^requestFailedHandler)(NSString *message);

@property (nonatomic, strong, readonly) NSArray *dataArray;

- (instancetype)init;

- (void)loadTweetsFromAccount:(NSString *)accountName;
- (void)loadMoreTweets;
- (void)pullToRefresh;
- (void)loadImageAtIndex:(NSInteger)index;

@end
