//
//  TweetExtendedEntities.h
//  AnimationTransitionMVP
//
//  Created by  user on 26.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deserializable.h"

@class TweetMedia;

@interface TweetExtendedEntities : NSObject<Deserializable>

@property (nonatomic, strong, readonly) TweetMedia *media;

@end
