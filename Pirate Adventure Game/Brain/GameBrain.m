//
//  GameBrain.m
//  Pirate Adventure Game
//
//  Created by Vincent Moyo on 2021/10/12.
//

#import "GameBrain.h"

@implementation GameBrain

-(BOOL)tileExistsAtPoint:(CGPoint) point forTiles: (NSArray *) tiles {
    if (point.y >= 0 && point.x >= 0 && point.x < [tiles count] && point.y < [[tiles objectAtIndex:point.x] count]) {
        return  YES;
    } else {
        return NO;
    }
}

-(void)declareWinnerForCharacter:(Character *)character andBoss: (Boss *)boss {
    while (boss.health > 0) {
        int bonusDamage = arc4random_uniform(5);
        boss.health = boss.health - character.damage;
        character.health = character.health - boss.damage - bonusDamage;
        
        if (character.health <= 0) {
            [self.delegate playerDidWin:NO];
            
            break;
        } else {
            if (boss.health <= 0) {
                [self.delegate playerDidWin:YES];
                break;;
            }
        }
    }
}

@end
