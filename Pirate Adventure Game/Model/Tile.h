//
//  Tile.h
//  Pirate Adventure Game
//
//  Created by Vincent Moyo on 2021/10/12.
//

#import <Foundation/Foundation.h>
#import <UIKIt/UIKit.h>
#import "Weapon.h"
#import "Armor.h"

NS_ASSUME_NONNULL_BEGIN

@interface Tile : NSObject

@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) UIImage *itemImage;
@property (strong, nonatomic) NSString *actionButtonName;
@property (strong, nonatomic) Weapon *weapon;
@property (strong, nonatomic) Armor *armor;
@property (nonatomic) int healthEffect;

@end

NS_ASSUME_NONNULL_END
