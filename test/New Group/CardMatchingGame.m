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

- (BOOL) isSwitchable {
    for (Card *card in self.cards) {
        if (card.isChoosen || card.isMatched) {
            return NO;
        }
    }
    return YES;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

/* 卡片匹配规则：
 1. 卡片数量（cardMatchNumber）大于1
 2. 从第二张开始，每翻一张，都去检查和之前翻开的是否有匹配，
    如果有任意一张不匹配：则重新开始
    如果全部匹配，又分为两种情况：
        1. 翻牌数量 == 游戏模式数：匹配成功，得分
        2. 翻牌数量 < 游戏模式数：继续翻牌
 
 */
- (void) chooseCardatIndexN:(NSUInteger)index gameMode: (NSUInteger)gameModeNumber {
    Card *card = [self cardAtIndex: index];
    int matchedCardCount = 1;
    int matchTotalScore = 0;
    if (!card.isMatched) {
        if (card.isChoosen) {
            card.chosen = NO;
        } else {
            for (Card *otherCard in self.cards) {
                if (otherCard.isChoosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (!matchScore) {
                        [self resetCard];
                    } else {
                        matchedCardCount ++;
                        matchTotalScore += matchScore;
                        if (matchedCardCount == gameModeNumber && matchedCardCount > 1) {
                            card.chosen = YES;
                            [self modifyCardAttr];
                            self.score += matchTotalScore * MATCH_BONUS;
                        } else {
                            otherCard.chosen = YES;
                            continue;
                        }
                    }
                }
            }
            card.chosen = YES;
            self.score -= COST_TO_CHOOSE;
            NSLog(@"matched card count -- %d", matchedCardCount);
        }
    }
}

// 重置所有的翻开的卡片
- (void) resetCard {
    for (Card *card in self.cards) {
        if (card.isChoosen && !card.isMatched) {
            card.chosen = NO;
            card.matched = NO;
        }
    }
}

// 匹配成功，更改卡片的属性
- (void) modifyCardAttr {
    for (Card *card in self.cards) {
        if (card.isChoosen) {
            card.matched = YES;
        }
    }
}

// 选择两张的时候调用的方法
- (void)chooseCardAtIndex:(NSUInteger)index {
    NSLog(@"2-cards-mode");
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

@end
