//
//  PlayingSetCard.h
//  test
//
//  Created by 李波涛 on 2019/9/8.
//  Copyright © 2019年 botao.li. All rights reserved.
//

#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlayingSetCard : Card

@property (nonatomic) NSUInteger *cardNumber;
@property (nonatomic, strong) NSString *cardShape;
@property (nonatomic, strong) NSString *cardColor;
@property (nonatomic, strong) NSString *cardShading;

- (NSUInteger) maxCardNumber;
- (NSArray *) validCardShape;
- (NSArray *) validCardColor;
- (NSArray *) validCardShading;

@end

NS_ASSUME_NONNULL_END
