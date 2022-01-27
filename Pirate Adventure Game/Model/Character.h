//
//  Character.h
//  Pirate Adventure Game
//
//  Created by Vincent Moyo on 2021/10/12.
//

#import <Foundation/Foundation.h>
#import "Armor.h"
#import "Weapon.h"
NS_ASSUME_NONNULL_BEGIN

@interface Character : NSObject

@property (strong, nonatomic) Armor *armor;
@property (strong, nonatomic) Weapon *weapon;
@property (nonatomic) int damage;
@property (nonatomic) int health;

-(void) calculateAttributesForArmor: (Armor *)armor withWeapon: (Weapon *) weapon withHealthEffect:(int) healthEffect;

@end

NS_ASSUME_NONNULL_END
