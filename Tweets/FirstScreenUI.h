//
//  FirstScreenUI.h
//  AnimationTranitionMVP
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "BaseScreenUI.h"

@interface FirstScreenUI : BaseScreenUI

@property (nonatomic, copy) void (^loadTweetsButtonClickHandler)(NSString *);

- (instancetype)init;

@end
