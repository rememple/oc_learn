//
//  SetGameViewController.m
//  test
//
//  Created by 李波涛 on 2019/9/7.
//  Copyright © 2019年 botao.li. All rights reserved.
//

#import "SetGameViewController.h"

@interface SetGameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardSetButton;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation SetGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)resetButton:(UIButton *)sender {
    NSLog(@"reset button touched .... ");
    self.scoreLabel.text = [NSString stringWithFormat:@"score: %d", 0];
//    self.game = nil;
//    [self updateUI];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    NSLog(@"card button touched .... ");
}

- (void)updateUI {
//    for (UIButton *cardButton in self.cardButtons) {
//        NSInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
//        Card *card = [self.game cardAtIndex:cardButtonIndex];
//        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
//        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
//        cardButton.enabled = !card.isMatched;
//        self.scoreLabel.text = [NSString stringWithFormat:@"score: %ld", self.game.score];
//    }
}



@end
