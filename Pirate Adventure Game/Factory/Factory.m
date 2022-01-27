//
//  Factory.m
//  Pirate Adventure Game
//
//  Created by Vincent Moyo on 2021/10/12.
//

#import "Factory.h"
#import "Tile.h"

@implementation Factory

+(NSArray *)createTiles {
    
    Tile *tile1 = [[Tile alloc] init];
    tile1.story = @"As the Hero do something";
    tile1.itemImage = [UIImage systemImageNamed:@"swift"];
    Weapon *bluntedSword = [[Weapon alloc] init];
    bluntedSword.name = @"Sword";
    bluntedSword.damage = 12;
    tile1.actionButtonName = @"Take the sword";
    tile1.healthEffect = 0;
    tile1.weapon = bluntedSword;
    
    Tile *tile2 = [[Tile alloc] init];
    tile2.story = @"Nevermind you suck so try this instead";
    tile2.itemImage = [UIImage systemImageNamed:@"headphones.circle"];
    Armor *armor = [[Armor alloc] init];
    armor.name = @"Sword";
    armor.health = 8;
    tile2.armor = armor;
    tile2.actionButtonName = @"Take the Armor";
    tile2.healthEffect = 0;
    
    Tile *tile3 = [[Tile alloc] init];
    tile3.story = @"We using Rusty sword";
    tile3.itemImage = [UIImage systemImageNamed:@"pencil"];
    armor.name = @"Sword";
    tile3.actionButtonName = @"Ask Dude";
    tile3.healthEffect = 12;
    
    NSMutableArray *firstColumn = [[NSMutableArray alloc] init];
    [firstColumn addObject:tile1];
    [firstColumn addObject:tile2];
    [firstColumn addObject:tile3];
    
    Tile *tile4 = [[Tile alloc] init];
    tile4.story = @"You've found a dog";
    tile4.itemImage = [UIImage systemImageNamed:@"pencil"];
    Armor *dogArmor = [[Armor alloc] init];
    dogArmor.health = 20;
    dogArmor.name = @"Dog";
    Weapon *dogWeapon = [[Weapon alloc] init];
    dogWeapon.damage = 10;
    dogWeapon.name = @"Fido";
    tile4.armor = dogArmor;
    tile4.actionButtonName = @"Adopt Fido";
    tile4.healthEffect = 0;
    
    Tile *tile5 = [[Tile alloc] init];
    tile5.story = @"You've found a chest";
    tile5.itemImage = [UIImage systemImageNamed:@"pencil"];
    Weapon *axeWeapon = [[Weapon alloc] init];
    axeWeapon.damage = 17;
    axeWeapon.name = @"Axe";
    tile5.actionButtonName = @"Take Axe";
    tile5.healthEffect = 0;
    tile5.weapon = axeWeapon;
    
    Tile *tile6 = [[Tile alloc] init];
    tile6.story = @"Tile 6";
    tile6.itemImage = [UIImage systemImageNamed:@"headphones.circle"];
    tile6.healthEffect = -22;
    tile6.actionButtonName = @"Kill them all!";
    
    NSMutableArray *secondColumn = [[NSMutableArray alloc] init];
    [secondColumn addObject:tile4];
    [secondColumn addObject:tile5];
    [secondColumn addObject:tile6];
    
    
    NSArray *tiles = [[NSArray alloc] initWithObjects:firstColumn,secondColumn, nil];
    
    return tiles;
}

+(Boss *)createBoss {
    Boss *boss = [[Boss alloc] init];
    boss.health = 65;
    boss.damage = 15;
    return  boss;
}

+(Character *)createCharacter {
    Character *character = [[Character alloc] init];
    character.health = 100;
    
    Armor *armor = [[Armor alloc] init];
    armor.name = @"Cloak";
    armor.health = 5;
    character.armor = armor;
    
    Weapon *weapon = [[Weapon alloc] init];
    weapon.name = @"Fists";
    character.weapon = weapon;
    
    character.damage = 0;
    
    return character;
}

@end
