//
//  ScreenUIFactory.h
//  AnimationTranitionMVP
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class FirstScreenUI;
@class SecondScreenUI;

@interface ScreenUIFactory : NSObject

- (FirstScreenUI *)makeFirstScreenUI;
- (SecondScreenUI *)makeSecondScreenUIWithTableView:(UITableView *)tableView;

- (instancetype)init;

@end
