//
//  Card.h
//  test
//
//  Created by 李波涛 on 2019/8/11.
//  Copyright © 2019年 botao.li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Card : NSObject

@property (strong, nonatomic) NSString *content;
@property (nonatomic, getter = isChoosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;
- (int) match: (NSArray *) otherCards;

@end

NS_ASSUME_NONNULL_END
