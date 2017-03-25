//
//  TableViewHolder.h
//  AnimationTransitionMVP
//
//  Created by Student on 15.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewHolder : NSObject

@property (nonatomic, copy) void (^reloadDataHandler)(void);
@property (nonatomic, copy) void (^pullToRefresh)(void);
@property (nonatomic, copy) void (^loadImageForRowHandler)(NSInteger);

@property (nonatomic, strong, readonly) UITableView *tableView;

- (instancetype)initWithDataSource:(NSArray *)dataSource NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;

- (void)reloadDataWithDataSource:(NSArray *)dataSource;
- (void)reloadCellAtIndex:(NSInteger)index;

@end
