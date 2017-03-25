//
//  TweetMedia.m
//  AnimationTransitionMVP
//
//  Created by Student on 22.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "TweetMedia.h"

#import "PropertyInfo.h"

@interface TweetMedia()

@property (nonatomic, copy, readwrite) NSString *url;
@property (nonatomic, copy, readwrite) NSString *media_url_https;

@end

@implementation TweetMedia
{
    UIImage *mediaImage;
}

- (instancetype)init
{
    self = [super init];
    return self;
}

+ (NSArray<PropertyInfo *> *)deserializableProperties
{
    return @
    [
     [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(url)) type:[NSString class]],
     [[PropertyInfo alloc] initWithProperty:NSStringFromSelector(@selector(media_url_https)) type:[NSString class]]
     ];
}

- (void)assignMediaImage:(UIImage *)image
{
    mediaImage = image;
}

- (NSString *)media_url_https
{
    return [_media_url_https stringByAppendingString:@":small"];
}

- (UIImage *)mediaImage
{
    return mediaImage;
}

@end
