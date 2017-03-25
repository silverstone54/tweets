//
//  IBaseScreenUI.h
//  AnimationTranitionMVP
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol IBaseScreenUI<NSObject>

@property (nonatomic, strong, readonly, nonnull) UIView *rootView;
@property (nonatomic, strong, readonly, nullable) id<UIViewControllerAnimatedTransitioning> transitionController;

@end
