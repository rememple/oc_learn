//
//  Card.m
//  test
//
//  Created by botao.li on 2019/8/4.
//  Copyright © 2019 botao.li. All rights reserved.
//

#import "Card.h"

@implementation Card

//@synthesize content = _content;

- (int) matched: (NSArray *) otherCards {
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.content isEqualToString:self.content]) {
            score = 1;
        }
    }
    
    return score;
}

@end
