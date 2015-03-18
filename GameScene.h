//
//  GameScene.h
//  Sabores
//

//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameScene : SKScene

-(instancetype) initWithFlavours: (NSArray *) flavours andIngredients: (NSArray *) ingredients;

@end
