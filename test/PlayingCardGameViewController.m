//
//  PlayingCardGameViewController.m
//  test
//
//  Created by 李波涛 on 2019/9/4.
//  Copyright © 2019年 botao.li. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"
@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

@end
