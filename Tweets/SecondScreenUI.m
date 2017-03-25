//
//  SecondScreenUI.m
//  AnimationTranitionMVP
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "SecondScreenUI.h"
#import "AnimationController.h"

@implementation SecondScreenUI
{
    UIView *darkView;
    UIActivityIndicatorView *activityIndicator;
    UITableView *table;
    
    AnimationController *controller;
}

- (instancetype)initWithTableView:(UITableView *)tableView
{
    self = [super init];
    
    controller = [[AnimationController alloc] init];
    
    table = tableView;
    
    [self makeView];
    
    return self;
}

- (instancetype)init
{
    assert( NO );
    return nil;
}

- (void)makeView
{
    assert( nil != table );
    
    [self.rootView addSubview:table];
    
    [self makeLoadingView];
    
    self.rootView.backgroundColor = [UIColor whiteColor];
}

- (void)makeLoadingView
{
    darkView = [[UIView alloc] initWithFrame:self.rootView.bounds];
    darkView.backgroundColor = [UIColor darkGrayColor];
    darkView.userInteractionEnabled = YES;
    darkView.alpha = 0.5f;
    darkView.hidden = YES;
    
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [activityIndicator startAnimating];
    activityIndicator.center = self.rootView.center;
    
    [self.rootView addSubview:darkView];
}

- (void)showActivityIndicator
{
    darkView.hidden = NO;
    [self.rootView addSubview:activityIndicator];
    [self showNetworkIndicator];
}

- (void)hideActivityIndicator
{
    darkView.hidden = YES;
    [activityIndicator removeFromSuperview];
//    [self hideNetworkIndicator];
}

- (void)showNetworkIndicator
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)hideNetworkIndicator
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (id<UIViewControllerAnimatedTransitioning>)transitionController
{
    return controller;
}

@end
