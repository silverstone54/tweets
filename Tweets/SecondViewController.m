//
//  SecondViewController.m
//  AnimationTranitionMVP
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondScreenPresenter.h"

@implementation SecondViewController
{
    AppContext *appContext;
}

- (instancetype)initWithAppContext:(AppContext *)context
{
    assert( nil != context );
    
    self = [super initWithAppContext:context];
    
    appContext = context;
    
    SecondScreenPresenter *presenter = [[SecondScreenPresenter alloc] initWithAppContext:context];
    
    self.screenPresenter = presenter;
    
    self.navigationItem.title = @"Tweets";
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    return self;
}

@end
