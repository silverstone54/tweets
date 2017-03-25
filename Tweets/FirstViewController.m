//
//  FirstViewController.m
//  AnimationTranitionMVP
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "FirstScreenPresenter.h"

@implementation FirstViewController
{
    AppContext *appContext;
    FirstScreenPresenter *presenter;
    
    UIAlertController *alert;
}

- (instancetype)initWithAppContext:(AppContext *)context
{
    assert( nil != context );
    
    self = [super initWithAppContext:context];
    
    appContext = context;
    
    presenter = [[FirstScreenPresenter alloc] initWithAppContext:context];
    
    self.screenPresenter = presenter;
    
    [self initCompletions];
    
    self.navigationItem.title = @"Get His Tweets";
    
    return self;
}

- (void)initCompletions
{
    typeof(self) __weak weakSelf = self;
    
    presenter.loadedDataCompletionHandler = ^
    {
        [weakSelf handleLoadedData];
    };
    presenter.showAlertHandler = ^(NSString *message)
    {
        [weakSelf showAlertWithMessage:message];
    };
}

- (void)handleLoadedData
{
    SecondViewController *secondViewController = [[SecondViewController alloc] initWithAppContext:appContext];
    
    [self.navigationController pushViewController:secondViewController animated:YES];
}

- (void)showAlertWithMessage:(NSString *)message
{
    if( nil == alert )
    {
        [self createAlertController];
    }
    
    alert.message = message;
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)createAlertController
{
    alert = [UIAlertController alertControllerWithTitle:@"Error\n" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   [alert dismissViewControllerAnimated:YES completion:nil];
                               }];
    [alert addAction:okAction];
}

@end
