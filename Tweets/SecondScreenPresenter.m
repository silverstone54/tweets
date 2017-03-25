//
//  SecondScreenPresenter.m
//  AnimationTranitionMVP
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "SecondScreenPresenter.h"
#import "SecondScreenUI.h"
#import "ScreenUIFactory.h"
#import "AppContext.h"
#import "TweetsDataProvider.h"
#import "TableViewHolder.h"

@implementation SecondScreenPresenter
{
    SecondScreenUI *screenUI;
    TableViewHolder *tableViewHolder;
    TweetsDataProvider *tweets;
}

- (instancetype)initWithAppContext:(AppContext *)context
{
    assert( nil != context );
    
    self = [super initWithAppContext:context];
    
    tweets = context.tweetsDataProvider;
    
    tableViewHolder = [[TableViewHolder alloc] initWithDataSource:tweets.dataArray];
    
    screenUI = [context.factory makeSecondScreenUIWithTableView:tableViewHolder.tableView];
    
    [self initCompletions];
    
    return self;
}

- (void)initCompletions
{
    typeof(self) __weak weakSelf = self;

    tweets.loadMoreTweetsCompletionHandler = ^
    {
        [weakSelf handleLoadMoreTweets];
    };
    tweets.reloadRowAtIndexCompletionHandler = ^(NSInteger index)
    {
        [weakSelf.tableViewHolder reloadCellAtIndex:index];
    };
    
    tableViewHolder.reloadDataHandler = ^
    {
        [weakSelf handleReloadData];
    };
    tableViewHolder.pullToRefresh = ^
    {
        [weakSelf pullToRefresh];
    };
    tableViewHolder.loadImageForRowHandler = ^(NSInteger index)
    {
        [weakSelf loadImageForRow:index];
    };
}

- (void)handleLoadMoreTweets
{
    dispatch_async(dispatch_get_main_queue(), ^
    {
        [screenUI hideNetworkIndicator];
        [screenUI hideActivityIndicator];
        
        [tableViewHolder reloadDataWithDataSource:tweets.dataArray];
    });
}

- (void)handleReloadData
{
    dispatch_async(dispatch_get_main_queue(), ^
    {
        [screenUI showActivityIndicator];
        [tweets loadMoreTweets];
    });
}

- (void)pullToRefresh
{
    [screenUI showNetworkIndicator];
    [tweets pullToRefresh];
}

- (void)loadImageForRow:(NSInteger)index
{
    [tweets loadImageAtIndex:index];
}

- (id<IBaseScreenUI>)screenUI
{
    return screenUI;
}

- (TableViewHolder *)tableViewHolder
{
    return tableViewHolder;
}

@end
