//
//  Weapon.h
//  Pirate Adventure Game
//
//  Created by Vincent Moyo on 2021/10/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Weapon : NSObject

@property (strong, nonatomic) NSString *name;
@property (nonatomic) int damage;

@end

NS_ASSUME_NONNULL_END
