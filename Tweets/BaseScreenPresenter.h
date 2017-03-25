//
//  BaseScreenPresenter.h
//  AnimationTranitionMVP
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AppContext;
@protocol IBaseScreenUI;

@interface BaseScreenPresenter : NSObject

@property (nonatomic, strong, readonly) id<IBaseScreenUI> screenUI;

- (instancetype)initWithAppContext:(AppContext *)context;

- (instancetype)init NS_UNAVAILABLE;

@end


