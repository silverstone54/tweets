//
//  TweetMedia.h
//  AnimationTransitionMVP
//
//  Created by Student on 22.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Deserializable.h"

@interface TweetMedia : NSObject<Deserializable>

@property (nonatomic, copy, readonly) NSString *url;
@property (nonatomic, copy, readonly) NSString *media_url_https;

@property (nonatomic, strong, readonly) UIImage *mediaImage;

- (instancetype)init;

- (void)assignMediaImage:(UIImage *)image;

@end
