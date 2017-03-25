//
//  TweetsTableViewCell.m
//  AnimationTransitionMVP
//
//  Created by Student on 15.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "TweetsTableViewCell.h"

@implementation TweetsTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    _profileImageView.layer.cornerRadius = 5.0;
    _bigImageView.layer.cornerRadius = 5.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (IBAction)urlButtonClick:(UIButton *)sender
{
    NSURL *url = [[NSURL alloc] initWithString:sender.titleLabel.text];
    
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
}

@end
