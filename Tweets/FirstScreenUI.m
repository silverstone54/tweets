//
//  FirstScreenUI.m
//  AnimationTranitionMVP
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "FirstScreenUI.h"
#import "AnimationController.h"

@implementation FirstScreenUI
{
    UIImageView *imageView;
    UITextField *textField;
    UIButton *button;
    UIActivityIndicatorView *activityIndicator;
    
    AnimationController *controller;
}

const NSInteger NAVBAR_HEIGHT = 64;

- (instancetype)init
{
    self = [super init];
    
    [self makeView];
    
    controller = [[AnimationController alloc] init];
    
    return self;
}

- (void)makeView
{
    [self makeActivityIndicator];
    
    [self makeButton];
    [self makeTextField];
    [self makeImageView];
}

- (void)makeActivityIndicator
{
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [activityIndicator startAnimating];
    activityIndicator.hidden = YES;
    activityIndicator.center = self.rootView.center;
}

- (void)makeButton
{
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 200, 40);
    button.layer.borderWidth = 0.5f;
    button.layer.cornerRadius = 5.0f;
    [button setTitle:@"Get" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    button.center = CGPointMake(self.rootView.center.x, self.rootView.center.y + button.bounds.size.height * 1.2);
    
    [self.rootView addSubview:button];
}

- (void)makeTextField
{
    textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width * 0.9, 40)];
    textField.layer.borderWidth = 0.5f;
    textField.layer.cornerRadius = 5.0f;
    textField.placeholder = @"chucknorris";
    textField.textAlignment = NSTextAlignmentCenter;
    textField.textContentType = UITextContentTypeName;
    textField.center = CGPointMake(button.center.x, self.rootView.center.y - button.bounds.size.height * 1.2);
    
    [textField becomeFirstResponder];
    
    [self.rootView addSubview:textField];
}

- (void)makeImageView
{
    UIImage *image = [UIImage imageNamed:@"twitter_icon"];
    
    imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    CGFloat heightTopSpace = textField.frame.origin.y - NAVBAR_HEIGHT;
    CGFloat centerY = heightTopSpace * 0.5 + NAVBAR_HEIGHT;
    imageView.frame = CGRectMake(0, 0, heightTopSpace * 0.4, heightTopSpace * 0.4);
    imageView.center = CGPointMake(self.rootView.center.x, centerY);
    
    [self.rootView addSubview:imageView];
}

- (void)buttonClick
{
    if( NULL != _loadTweetsButtonClickHandler )
    {
        _loadTweetsButtonClickHandler([textField.text lowercaseString]);
    }
}

- (void)showActivityIndicator
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [self.rootView addSubview:activityIndicator];
}

- (void)hideActivityIndicator
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [activityIndicator removeFromSuperview];
}

- (id<UIViewControllerAnimatedTransitioning>)transitionController
{
    return controller;
}

@end
