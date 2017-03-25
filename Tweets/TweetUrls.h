//
//  TweetUrls.h
//  AnimationTransitionMVP
//
//  Created by Student on 25.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deserializable.h"

@interface TweetUrls : NSObject<Deserializable>

@property (nonatomic, copy, readonly) NSString *url;

- (instancetype)init;

@end
