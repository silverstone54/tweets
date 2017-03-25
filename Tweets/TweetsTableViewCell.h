//
//  TweetsTableViewCell.h
//  AnimationTransitionMVP
//
//  Created by Student on 15.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetsTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *profileImageView;
@property (nonatomic, weak) IBOutlet UIImageView *retweetImageView;
@property (nonatomic, weak) IBOutlet UIImageView *bigImageView;

@property (nonatomic, weak) IBOutlet UILabel *retweetedNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *accountNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *createdAtLabel;
@property (nonatomic, weak) IBOutlet UILabel *contentLabel;
@property (nonatomic, weak) IBOutlet UIButton *urlButton;

@property (nonatomic, weak) IBOutlet UIButton *retweetButton;
@property (nonatomic, weak) IBOutlet UIButton *favoriteButton;

@end
