//
//  Factory.h
//  Pirate Adventure Game
//
//  Created by Vincent Moyo on 2021/10/12.
//

#import <Foundation/Foundation.h>
#import "Boss.h"
#import "Character.h"

NS_ASSUME_NONNULL_BEGIN

@interface Factory : NSObject

+(NSArray *)createTiles;
+(Boss *)createBoss;
+(Character *)createCharacter;

@end

NS_ASSUME_NONNULL_END
