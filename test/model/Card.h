//
//  Card.h
//  test
//
//  Created by botao.li on 2019/8/4.
//  Copyright © 2019 botao.li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Card : NSObject

@property (strong, nonatomic) NSString *content;
@property (nonatomic, getter = isChoosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

@end

NS_ASSUME_NONNULL_END
