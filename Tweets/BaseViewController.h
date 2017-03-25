//
//  BaseViewController.h
//  AnimationTranitionMVP
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AppContext;
@class BaseScreenPresenter;

@interface BaseViewController : UIViewController

@property (nonatomic, strong) BaseScreenPresenter *screenPresenter;

- (instancetype)initWithAppContext:(AppContext *)context NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

@end
