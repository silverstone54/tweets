//
//  AppController.h
//  AnimationTranitionMVP
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AppContext;

@interface AppController : NSObject

- (instancetype)initWithAppContext:(AppContext *)context;

- (instancetype)init NS_UNAVAILABLE;

@end
