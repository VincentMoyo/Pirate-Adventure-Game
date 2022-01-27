//
//  Character.m
//  Pirate Adventure Game
//
//  Created by Vincent Moyo on 2021/10/12.
//

#import "Character.h"

@implementation Character

-(void) calculateAttributesForArmor: (Armor *)armor withWeapon: (Weapon *) weapon withHealthEffect:(int) healthEffect {
    if (armor != nil) {
        self.health = self.health - self.armor.health + armor.health; // armor is parameter
        self.armor = armor;
    }
    if (weapon != nil) {
        self.damage = self.damage - self.weapon.damage + weapon.damage;
        self.weapon = weapon;
    }
    if (healthEffect != 0) {
        self.health = self.health + healthEffect;
    }
}

@end
