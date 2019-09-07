//
//  ViewController.m
//  test
//
//  Created by botao.li on 2019/8/1.
//  Copyright © 2019 botao.li. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (nonatomic) NSInteger gameMode;
@property (strong, nonatomic) UIAlertAction *okAction;
@property (strong, nonatomic) UIAlertAction *cancelAction;

@end

@implementation ViewController

- (CardMatchingGame *)game {
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gameMode = 2;
    // Do any additional setup after loading the view.
}

- (Deck *)deck {
    if (!_deck) {
        _deck = [self createDeck];
    }
    return _deck;
}
- (Deck *) createDeck { // abstract
    return nil;
}

- (void) setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"flips: %d", self.flipCount];
}

// 切换游戏模式
- (IBAction)switchMode:(UISwitch *)sender {
    UISwitch *switchButton = (UISwitch*)sender;
    // 如果游戏正在进行中，不可以切换 -- 优化
    if (![self.game isSwitchable]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"游戏进行中，不能切换模式" preferredStyle:UIAlertControllerStyleAlert];
        _okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
        }];
        [alert addAction:_okAction];
        [self presentViewController:alert animated:true completion:nil];
        return;
    }
    BOOL isButtonOn = [switchButton isOn];
    if (isButtonOn) {
        self.gameMode = 3;
    }else {
        self.gameMode = 2;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"score: %d", 0];
    self.game = nil;
    [self updateUI];
}

// 重置卡片按钮
- (IBAction)resetCards:(UIButton *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确认要重置吗？" preferredStyle:UIAlertControllerStyleAlert];
    _okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
        self.scoreLabel.text = [NSString stringWithFormat:@"score: %d", 0];
        self.game = nil;
        [self updateUI];
    }];
    _cancelAction =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:_okAction];
    [alert addAction:_cancelAction];
    
    // 弹出对话框
    [self presentViewController:alert animated:true completion:nil];
}

// 点击卡片
- (IBAction)cardTouchButton:(UIButton *)sender {
    NSInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardatIndexN:chosenButtonIndex gameMode:_gameMode];
    [self updateUI];
    self.flipCount++;
}

- (void)updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        NSInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"score: %ld", self.game.score];
    }
}

- (NSString *)titleForCard:(Card *)card {
    return card.isChoosen ? card.content : @"";
}
- (UIImage *)backgroundImageForCard:(Card *)card {
    return [UIImage imageNamed:card.isChoosen ? @"cardfront" : @"stanford-tree"];
}


@end
