//
//  BaseViewController.m
//  AnimationTranitionMVP
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseScreenPresenter.h"
#import "BaseScreenUI.h"
#import "TransitionDelegate.h"

@interface BaseViewController()<UINavigationControllerDelegate>

@end

@implementation BaseViewController

- (instancetype)initWithAppContext:(AppContext *)context
{
    self = [super initWithNibName:nil bundle:nil];
    
    return self;
}

- (void)loadView
{
    assert( nil != self.screenPresenter );
    
    self.view = self.screenPresenter.screenUI.rootView;
}

- (void)didMoveToParentViewController:(UIViewController *)parent
{
    self.navigationController.delegate = self;
}

- (void)setScreenPresenter:(BaseScreenPresenter *)screenPresenter
{
    assert( nil != screenPresenter );
    
    _screenPresenter = screenPresenter;
}

- (id<UIViewControllerTransitioningDelegate>)transitioningDelegate
{
    id<UIViewControllerAnimatedTransitioning> transitionController = self.screenPresenter.screenUI.transitionController;
    
    if( nil != transitionController )
    {
        TransitionDelegate *delegate = [[TransitionDelegate alloc] initWithController:transitionController];
        return delegate;
    }
    
    return nil;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    return self.screenPresenter.screenUI.transitionController;
}

@end
