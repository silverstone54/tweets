//
//  TransitionDelegate.m
//  AnimationTransitionMVP
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "TransitionDelegate.h"

@implementation TransitionDelegate
{
    id<UIViewControllerAnimatedTransitioning> animationController;
}

- (instancetype)initWithController:(id<UIViewControllerAnimatedTransitioning>)controller
{
    assert( nil != controller );
    
    self = [super init];
    
    animationController = controller;
    
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return animationController;
}

@end
