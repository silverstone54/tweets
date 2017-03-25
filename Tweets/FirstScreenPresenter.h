//
//  FirstScreenPresenter.h
//  AnimationTranitionMVP
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "BaseScreenPresenter.h"

@interface FirstScreenPresenter : BaseScreenPresenter

@property (nonatomic, copy) void (^loadedDataCompletionHandler)(void);
@property (nonatomic, copy) void (^showAlertHandler)(NSString *message);

- (instancetype)initWithAppContext:(AppContext *)context;

@end
