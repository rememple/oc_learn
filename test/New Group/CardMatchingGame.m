//
//  CardMatchingGame.m
//  test
//
//  Created by botao.li on 2019/8/11.
//  Copyright © 2019 botao.li. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSInteger)count usingDeck:(Deck *)deck {
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRanomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index {
    if (index < [self.cards count]) {
        return self.cards[index];
    } else {
        return nil;
    }
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex: index];
    if (!card.isMatched) {
        if (card.isChoosen) {
            card.chosen = NO;
        } else {
            for (Card *otherCard in self.cards) {
                if (otherCard.isChoosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

- (void) chooseCardAtIndex2:(NSUInteger)index {
    Card *card = [self cardAtIndex: index];
    if (!card.isMatched) {
        if (card.isChoosen) {
            card.chosen = NO;
        } else {
            for (Card *otherCard in self.cards) {
                if (otherCard.isChoosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (!matchScore) {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    } else {
                        continue;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
    
}

- (void) chooseCardAtIndex3:(NSInteger)index {
    Card *card = [self cardAtIndex: index];
    for (Card *otherCard in self.cards) {
        if (otherCard.isChoosen && !otherCard.isMatched) {
            int matchScore = [card match:@[otherCard]];
            if (matchScore) {
                self.score += matchScore * MATCH_BONUS;
                otherCard.matched = YES;
                card.matched = YES;
            } else {
                self.score -= MISMATCH_PENALTY;
                otherCard.chosen = NO;
            }
            break;
        }
        self.score -= COST_TO_CHOOSE;
    }
}
// 如果是三张牌的模式：翻第二张牌时开始判断是否匹配，如果匹配，可以继续翻第三张，如果不匹配，则重置；如果第三张也匹配，则得分；如果第三张不匹配，则重置；

- (int) getChosenCardCount {
    int choseCardCount = 0;
    for (Card *card in self.cards) {
        if (card.isChoosen) {
            choseCardCount ++;
        }
    }
    return choseCardCount;
}

@end
