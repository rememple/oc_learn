//
//  Deck.h
//  test
//
//  Created by 李波涛 on 2019/8/11.
//  Copyright © 2019年 botao.li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface Deck : NSObject

- (void) addCard: (Card *) card atTop:(BOOL)atTop;
- (void) addCard:(Card *)card;

- (Card *) drawRanomCard;

@end

NS_ASSUME_NONNULL_END
