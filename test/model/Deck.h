//
//  Deck.h
//  test
//
//  Created by botao.li on 2019/8/4.
//  Copyright © 2019 botao.li. All rights reserved.
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
