//
//  AppController.m
//  AnimationTranitionMVP
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppController.h"
#import "AppContext.h"
#import "FirstViewController.h"

@implementation AppController
{
    UIWindow *window;
    UINavigationController *navigationController;
}

- (instancetype)initWithAppContext:(AppContext *)context
{
    assert( nil != context );
    
    self = [super init];
    
    [self makeWindow];
    
    FirstViewController *firstViewController = [[FirstViewController alloc] initWithAppContext:context];
    navigationController = [[UINavigationController alloc] initWithRootViewController:firstViewController];
    
    window.rootViewController = navigationController;
    [window makeKeyAndVisible];
    
    return self;
}

- (void)makeWindow
{
    window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
}

- (instancetype)init
{
    assert( NO );
    return nil;
}

@end
