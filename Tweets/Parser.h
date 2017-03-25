//
//  Parser.h
//  AnimationTransitionMVP
//
//  Created by Student on 10.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Parser<NSObject>

- (id)parseResponse:(id)json expectedClass:(Class)class;

@end
