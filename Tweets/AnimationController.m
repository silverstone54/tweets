//
//  AnimationController.m
//  AnimationTransitionMVP
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "AnimationController.h"

@implementation AnimationController
{
    
}

- (instancetype)init
{
    self = [super init];
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *frontView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    toView.alpha = 0.0f;
//    CGAffineTransform transform = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI);;
    CGAffineTransform transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.3f, 0.3f);
    toView.transform = transform;
    
    [transitionContext.containerView addSubview:toView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        frontView.alpha = 0.0f;
        toView.alpha = 1.0f;
        toView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}

@end
