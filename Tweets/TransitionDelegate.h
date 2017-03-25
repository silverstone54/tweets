//
//  TransitionDelegate.h
//  AnimationTransitionMVP
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TransitionDelegate : NSObject<UIViewControllerTransitioningDelegate>

- (instancetype)initWithController:(id<UIViewControllerAnimatedTransitioning>)controller;

@end
