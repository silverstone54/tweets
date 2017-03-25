//
//  Downloader.m
//  AnimationTransitionMVP
//
//  Created by User on 15.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "Downloader.h"

@implementation Downloader

- (instancetype)init
{
    self = [super init];
    return self;
}

- (void)downloadImageWithURL:(NSString *)url completion:(void (^)(UIImage *))completion
{
    [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    
    NSURL *imageURL = [NSURL URLWithString:url];
    NSURLSessionDownloadTask *downloadTask;
    downloadTask = [[NSURLSession sharedSession] downloadTaskWithURL:imageURL completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error)
                    {
                        UIImage *downloadedImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
                        
                        completion(downloadedImage);
                    }];
    
    [downloadTask resume];
}

@end
