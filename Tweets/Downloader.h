//
//  Downloader.h
//  AnimationTransitionMVP
//
//  Created by User on 15.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Downloader : NSObject

- (instancetype)init;

- (void)downloadImageWithURL:(NSString *)url completion:(void(^)(UIImage *))completion;

@end
