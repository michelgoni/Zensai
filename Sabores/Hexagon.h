//
//  Touches.h
//  Sabores
//
//  Created by Michel Goñi on 20/3/15.
//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Hexagon : SKNode

@property (copy, nonatomic) NSString *saborID;

@property (strong, nonatomic) SKShapeNode *hexagono;
@property (strong, nonatomic) SKLabelNode *hexagonLabelName;

-(instancetype)initWithColor: (int) color;

@end
