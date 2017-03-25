//
//  AppDelegate.m
//  AnimationTranitionMVP
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "AppDelegate.h"
#import "ScreenUIFactory.h"
#import "AppController.h"
#import "AppContext.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
{
    AppController *appController;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    AppContext *context = [[AppContext alloc] init];
    appController = [[AppController alloc] initWithAppContext:context];
    return YES;
}


@end
