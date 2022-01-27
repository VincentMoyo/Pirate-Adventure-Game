//
//  ViewController.m
//  Pirate Adventure Game
//
//  Created by Vincent Moyo on 2021/10/12.
//

#import "ViewController.h"
#import "Character.h"
#import "Boss.h"
#import "Factory.h"
#import "Tile.h"
#import "GameBrain.h"

@interface ViewController () <GameBrainDelegate>

@property (strong, nonatomic) NSArray *tiles;
@property (strong, nonatomic) Character *character;
@property (strong, nonatomic) Boss *boss;
@property (nonatomic) CGPoint currentPoint;
@property (strong, nonatomic) GameBrain *gameBrain;

@property (weak, nonatomic) IBOutlet UILabel *healthLabel;
@property (weak, nonatomic) IBOutlet UILabel *damageLabel;
@property (weak, nonatomic) IBOutlet UILabel *weaponLabel;
@property (weak, nonatomic) IBOutlet UILabel *armorLabel;

@property (weak, nonatomic) IBOutlet UILabel *storyLabel;

@property (weak, nonatomic) IBOutlet UIButton *actionButton;
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;

@property (weak, nonatomic) IBOutlet UIButton *northButton;
@property (weak, nonatomic) IBOutlet UIButton *eastButton;
@property (weak, nonatomic) IBOutlet UIButton *southButton;
@property (weak, nonatomic) IBOutlet UIButton *westButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupGame];
}

- (IBAction)actionPressed:(UIButton *)sender {
    
    if (self.currentPoint.x == 3 && self.currentPoint.y == 2) {
        [self.gameBrain declareWinnerForCharacter:self.character andBoss:self.boss];
    } else {
        Tile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
        [self.character calculateAttributesForArmor:tile.armor withWeapon:tile.weapon withHealthEffect:tile.healthEffect];
        [self updateTile];
        self.actionButton.enabled = NO;
    }
}

- (IBAction)northPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y + 1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)eastPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)southPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)westPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)resetPressed:(UIButton *)sender {
    self.character = nil;
    self.boss = nil;
    self.tiles = nil;
    [self setupGame];
}

-(void) updateButtons {
    self.westButton.hidden = ![self.gameBrain tileExistsAtPoint: CGPointMake(self.currentPoint.x - 1, self.currentPoint.y) forTiles:self.tiles];
    self.eastButton.hidden = ![self.gameBrain tileExistsAtPoint: CGPointMake(self.currentPoint.x + 1, self.currentPoint.y) forTiles:self.tiles];
    self.northButton.hidden = ![self.gameBrain tileExistsAtPoint: CGPointMake(self.currentPoint.x, self.currentPoint.y + 1) forTiles:self.tiles];
    self.southButton.hidden = ![self.gameBrain tileExistsAtPoint: CGPointMake(self.currentPoint.x, self.currentPoint.y - 1) forTiles:self.tiles];
}

- (void) updateTile {
    self.actionButton.enabled = YES;
    Tile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.storyLabel.text = tileModel.story;
    self.itemImageView.image = tileModel.itemImage;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.armorLabel.text = self.character.armor.name;
    self.weaponLabel.text = self.character.weapon.name;
    [self.actionButton setTitle: tileModel.actionButtonName forState:UIControlStateNormal];
}

- (void) setupGame {
    self.tiles = [Factory createTiles];
    self.character = [Factory createCharacter];
    self.boss = [Factory createBoss];
    
    self.currentPoint = CGPointMake(0, 0);
    
    self.gameBrain = [[GameBrain alloc] init];
    self.gameBrain.delegate = self;
    [self.character calculateAttributesForArmor:nil withWeapon:nil withHealthEffect:0];
    
    [self updateTile];
    [self updateButtons];
    
}

-(void)showAlert: (NSString *)header withMessage: (NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:header
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil];
    [alert addAction:okAction];
    [self presentViewController:alert animated:true completion:nil];
}



- (void)playerDidWin:(BOOL)playerWon {
    if (playerWon == YES) {
        [self showAlert:@"Victory" withMessage:@"You are the defeated!"];
    } else {
        [self showAlert:@"Death" withMessage:@"You dead!"];
    }
}


@end
