//
//  MatchingBad.h
//  Sabores
//
//  Created by Michel Goñi on 23/3/15.
//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameScene.h"

@interface MatchingBadScene : SKScene
@property (strong, nonatomic) UILabel *matchingLabel;
@property (strong, nonatomic) NSString *comment;
@property (strong, nonatomic) NSString *ingredient1Name;
@property (strong, nonatomic) NSString *ingredient2Name;

@end
