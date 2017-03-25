//
//  TweetEntities.h
//  AnimationTransitionMVP
//
//  Created by Student on 22.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deserializable.h"

@class TweetMedia;
@class TweetUrls;

@interface TweetEntities : NSObject<Deserializable>

@property (nonatomic, strong, readonly) TweetMedia *media;
@property (nonatomic, strong, readonly) TweetUrls *urls;

- (instancetype)init;

@end
