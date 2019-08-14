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
#import "CardMatchingGame.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation ViewController

- (CardMatchingGame *)game {
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}

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
- (IBAction)resetCards:(UIButton *)sender {
    self.scoreLabel.text = [NSString stringWithFormat:@"score: %d", 0];
    _game = nil;
    [self updateUI];
}
- (IBAction)cardTouchButton:(UIButton *)sender {
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    NSLog(@"chosenButtonIndex==== %d", chosenButtonIndex);
    [self updateUI];
    NSLog(@"log...");
    self.flipCount++;

////    UIImage *cardImage = [UIImage imageNamed:@"stanford"];
//    if ([sender.currentTitle length]) {
//        [sender setBackgroundImage:[UIImage imageNamed:@"stanford-tree"] forState:UIControlStateNormal];
//        [sender setTitle:@"" forState:UIControlStateNormal];
//        self.flipCount++;
//    } else {
////        UIImage *cardImage = [UIImage imageNamed:@"cardfront"];
//        Card *randomCard = [self.deck drawRanomCard];
//        if (randomCard) {
//            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
//            [sender setTitle: randomCard.content forState:UIControlStateNormal];
//            self.flipCount++;
//        } else {
//            sender.enabled = NO;
//        }
//    }
////    NSLog(@"%d", self.flipCount++);
}

- (void)updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"score: %d", self.game.score];
        NSLog(@"log....2");
        NSLog(@"score = %d", self.game.score);
    }
}

- (NSString *)titleForCard:(Card *)card {
    NSLog(@"log....3 %d", card.isChoosen);
    return card.isChoosen ? card.content : @"";
}
- (UIImage *)backgroundImageForCard:(Card *)card {
    return [UIImage imageNamed:card.isChoosen ? @"cardfront" : @"stanford-tree"];
}


@end
