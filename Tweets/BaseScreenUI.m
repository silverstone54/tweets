//
//  BaseScreenUI.m
//  AnimationTranitionMVP
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "BaseScreenUI.h"

@implementation BaseScreenUI
{
    UIView *view;
}

- (instancetype)init
{
    self = [super init];
    
    [self makeRootView];
    
    return self;
}

- (void)makeRootView
{
    view = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    view.backgroundColor = [UIColor whiteColor];
}

- (void)showActivityIndicator
{
}

- (void)hideActivityIndicator
{
}

- (UIView *)rootView
{
    return view;
}

- (id<UIViewControllerAnimatedTransitioning>)transitionController
{
    return nil;
}

@end
