//
//  BaseScreenPresenter.m
//  AnimationTranitionMVP
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "BaseScreenPresenter.h"

@implementation BaseScreenPresenter

- (instancetype)initWithAppContext:(AppContext *)context
{
    self = [super init];
    return self;
}

- (id<IBaseScreenUI>)screenUI
{
    return nil;
}

- (instancetype)init
{
    assert( NO );
    return nil;
}

@end
