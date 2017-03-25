//
//  TweetUser.h
//  AnimationTransitionMVP
//
//  Created by  user on 20.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deserializable.h"

@interface TweetUser : NSObject<Deserializable>

@property (nonatomic, copy, readonly) NSString *screen_name;
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *profile_image_url_https;

- (instancetype)init;

@end
