//
//  PlayingSetCard.m
//  test
//
//  Created by 李波涛 on 2019/9/8.
//  Copyright © 2019年 botao.li. All rights reserved.
//

#import "PlayingSetCard.h"

@implementation PlayingSetCard

- (NSArray *) SetCardNumbers {
    return @[@1, @2, @3];
}

- (NSUInteger) maxCardNumber {
    return [[self SetCardNumbers] count] - 1;
}
- (NSArray *) validCardShape {
    return @[@"△", @"O", @"口"];
}
- (NSArray *) validCardColor {
    return @[];
}
- (NSArray *) validCardShading {
    return @[];
}

@end
