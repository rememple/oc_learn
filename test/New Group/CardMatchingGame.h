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
- (void)chooseCardatIndexN:(NSUInteger)index gameMode:(NSUInteger) gameModeNumber;
- (Card *)cardAtIndex:(NSUInteger)index;
- (BOOL) isSwitchable;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, readonly) NSMutableArray *selectedCardGroupArray;

@end

NS_ASSUME_NONNULL_END
