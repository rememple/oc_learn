//
//  CardMatchingGame.h
//  test
//
//  Created by botao.li on 2019/8/11.
//  Copyright © 2019 botao.li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface CardMatchingGame : NSObject

- (instancetype)initWithCardCount:(NSInteger)count usingDeck:(Deck *)deck;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (void)chooseCardAtIndex2:(NSUInteger)index;
- (void)chooseCardAtIndex3:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;
- (int) getChosenCardCount;

@property (nonatomic, readonly) NSInteger score;

@end

NS_ASSUME_NONNULL_END
