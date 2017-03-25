//
//  BaseScreenUI.h
//  AnimationTranitionMVP
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "IBaseScreenUI.h"

@interface BaseScreenUI : NSObject<IBaseScreenUI>

- (instancetype)init;

- (void)showActivityIndicator;
- (void)hideActivityIndicator;

@end
