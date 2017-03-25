//
//  ScreenUIFactory.m
//  AnimationTranitionMVP
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "ScreenUIFactory.h"
#import "FirstScreenUI.h"
#import "SecondScreenUI.h"

@implementation ScreenUIFactory

- (FirstScreenUI *)makeFirstScreenUI
{
    return [[FirstScreenUI alloc] init];
}

- (SecondScreenUI *)makeSecondScreenUIWithTableView:(UITableView *)tableView
{
    return [[SecondScreenUI alloc] initWithTableView:tableView];
}

- (instancetype)init
{
    self = [super init];
    
    return self;
}

@end
