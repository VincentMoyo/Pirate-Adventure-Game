//
//  GameBrain.h
//  Pirate Adventure Game
//
//  Created by Vincent Moyo on 2021/10/12.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Character.h"
#import "Boss.h"

@protocol GameBrainDelegate <NSObject>

@required

-(void)playerDidWin:(BOOL)player;


@end

NS_ASSUME_NONNULL_BEGIN

@interface GameBrain : NSObject

-(BOOL)tileExistsAtPoint:(CGPoint) point forTiles: (NSArray *) tiles;
-(void)declareWinnerForCharacter:(Character *)character andBoss: (Boss *)boss;

@property (nonatomic, weak) id <GameBrainDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
