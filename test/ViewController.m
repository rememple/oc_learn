//
//  ViewController.m
//  test
//
//  Created by botao.li on 2019/8/1.
//  Copyright © 2019 botao.li. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (Deck *)deck {
    if (!_deck) {
        _deck = [self createDeck];
    }
    return _deck;
}
- (Deck *) createDeck {
    return [[PlayingCardDeck alloc] init];
}

- (void) setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"flips: %d", self.flipCount];
}
- (IBAction)cardTouchButton:(UIButton *)sender {
//    UIImage *cardImage = [UIImage imageNamed:@"stanford"];
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"stanford"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
        self.flipCount++;
    } else {
//        UIImage *cardImage = [UIImage imageNamed:@"cardfront"];
        Card *randomCard = [self.deck drawRanomCard];
        if (randomCard) {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
            [sender setTitle: randomCard.content forState:UIControlStateNormal];
            self.flipCount++;
        } else {
            sender.enabled = NO;
        }
    }
//    NSLog(@"%d", self.flipCount++);
}


@end
