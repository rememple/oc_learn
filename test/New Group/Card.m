//
//  Card.m
//  test
//
//  Created by 李波涛 on 2019/8/11.
//  Copyright © 2019年 botao.li. All rights reserved.
//

#import "Card.h"

@implementation Card

//@synthesize content = _content;

- (int) match: (NSArray *) otherCards {
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.content isEqualToString:self.content]) {
            score = 1;
        }
    }
    
    return score;
}

@end
