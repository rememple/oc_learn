//
//  PlayingCard.h
//  test
//
//  Created by botao.li on 2019/8/4.
//  Copyright © 2019 botao.li. All rights reserved.
//

#import "Card.h"
NS_ASSUME_NONNULL_BEGIN

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end

NS_ASSUME_NONNULL_END
