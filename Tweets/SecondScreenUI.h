//
//  SecondScreenUI.h
//  AnimationTranitionMVP
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "BaseScreenUI.h"

@interface SecondScreenUI : BaseScreenUI

- (instancetype)initWithTableView:(UITableView *)tableView NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;

- (void)showNetworkIndicator;
- (void)hideNetworkIndicator;

@end
