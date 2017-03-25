//
//  TableViewHolder.m
//  AnimationTransitionMVP
//
//  Created by Student on 15.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "TableViewHolder.h"
#import "TweetsTableViewCell.h"

#import "Tweet.h"
#import "TweetUser.h"
#import "TweetRetweeted.h"
#import "TweetEntities.h"
#import "TweetMedia.h"
#import "TweetUrls.h"

@interface TableViewHolder() <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong, readwrite) UITableView *tableView;

@end

@implementation TableViewHolder
{
    NSArray *dataArray;
    
    NSMutableDictionary *cellsHeight;
    
    UIRefreshControl *refreshControl;
    
    BOOL reloadDataInProgress;
}

- (instancetype)initWithDataSource:(NSArray *)dataSource
{
    self = [super init];
    
    dataArray = dataSource;
    
    cellsHeight = [[NSMutableDictionary alloc] init];
    
    reloadDataInProgress = NO;
    
    [self makeTableView];
    [self makeRefreshControl];
    
    return self;
}

- (void)makeTableView
{
    _tableView = [[UITableView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.estimatedRowHeight = 50;
    _tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)makeRefreshControl
{
    refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(handleRefreshControl) forControlEvents:UIControlEventValueChanged];
    [_tableView addSubview:refreshControl];
}

- (void)handleRefreshControl
{
    if( NULL != _pullToRefresh )
    {
        _pullToRefresh();
        
        [refreshControl beginRefreshing];
    }
}

- (void)reloadDataWithDataSource:(NSArray *)dataSource
{
    dataArray = dataSource;
    
    [cellsHeight removeAllObjects];
    
    if( YES == refreshControl.isRefreshing )
    {
        [refreshControl endRefreshing];
    }
    
    [_tableView reloadData];
    reloadDataInProgress = NO;
}

- (void)reloadCellAtIndex:(NSInteger)index
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    
    if( [_tableView.indexPathsForVisibleRows containsObject:indexPath] )
    {
        [_tableView beginUpdates];
        [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [_tableView endUpdates];
    }
}

#pragma make Scroll view delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float height = scrollView.frame.size.height;
    float contentOffset = scrollView.contentOffset.y;
    float distanceFromBottom = scrollView.contentSize.height - contentOffset;
    
    if( NO == reloadDataInProgress && scrollView.contentSize.height > 0 && distanceFromBottom < height )
    {
        if( NULL != _reloadDataHandler )
        {
            reloadDataInProgress = YES;
            _reloadDataHandler();
        }
    }
}

#pragma make Table view data source & delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *height = cellsHeight[indexPath];
    if( nil != height )
    {
        return height.floatValue;
    }
    
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cellsHeight[indexPath] = @(cell.frame.size.height);
    
    Tweet *tweet = dataArray[indexPath.row];
    
    if( indexPath.row <= tableView.indexPathsForVisibleRows.lastObject.row )
    {
        if( nil != tweet.entities.media.media_url_https && nil == tweet.entities.media.mediaImage )
        {
            if( NULL != _loadImageForRowHandler )
            {
                _loadImageForRowHandler(indexPath.row);
            }
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const tweetsCellIdentifier = @"TweetsTableViewCell";
    
    TweetsTableViewCell *tweetsCell = [tableView dequeueReusableCellWithIdentifier:tweetsCellIdentifier];
    
    if( nil == tweetsCell )
    {
        tweetsCell = [[NSBundle mainBundle] loadNibNamed:tweetsCellIdentifier owner:nil options:nil].firstObject;
    }
    
    Tweet *tweet = dataArray[indexPath.row];
    
    if( nil == tweet.retweeted_status )
    {
        [tweetsCell.retweetImageView removeFromSuperview];
        tweetsCell.profileImageView.image = tweet.profile_image;
        
        [tweetsCell.retweetedNameLabel removeFromSuperview];
        tweetsCell.nameLabel.text = tweet.user.name;
        tweetsCell.accountNameLabel.text = [@"@" stringByAppendingString:tweet.user.screen_name];
        
        [tweetsCell.retweetButton setTitle:[tweet.retweet_count stringValue] forState:UIControlStateNormal];
        [tweetsCell.favoriteButton setTitle:[tweet.favorite_count stringValue] forState:UIControlStateNormal];
    }
    else
    {
        tweetsCell.profileImageView.image = tweet.retweeted_status.retweetProfileImage;
        
        tweetsCell.retweetedNameLabel.text = [tweet.user.name stringByAppendingString:@" retweeted"];
        tweetsCell.nameLabel.text = tweet.retweeted_status.user.name;
        tweetsCell.accountNameLabel.text = [@"@" stringByAppendingString:tweet.retweeted_status.user.screen_name];
        
        [tweetsCell.retweetButton setTitle:[tweet.retweeted_status.retweet_count stringValue] forState:UIControlStateNormal];
        [tweetsCell.favoriteButton setTitle:[tweet.retweeted_status.favorite_count stringValue] forState:UIControlStateNormal];
    }
    
    if( nil == tweet.entities.media )
    {
        [tweetsCell.bigImageView removeFromSuperview];
    }
    else
    {
        tweetsCell.bigImageView.image = tweet.entities.media.mediaImage;
    }
    
    NSString *url = [tweet url];
    if( nil != url )
    {
        [tweetsCell.urlButton setTitle:url forState:UIControlStateNormal];
    }
    else
    {
        [tweetsCell.urlButton removeFromSuperview];
    }
    
    tweetsCell.createdAtLabel.text = tweet.created_at;
    tweetsCell.contentLabel.text = tweet.text;
    
    return tweetsCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Tweet *tweet = dataArray[indexPath.row];
    if( nil != tweet.entities.media )
    {
        if( NULL != _loadImageForRowHandler && nil == tweet.entities.media.mediaImage )
        {
            _loadImageForRowHandler(indexPath.row);
        }
    }
}

@end
