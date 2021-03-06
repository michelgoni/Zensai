//
//  Touches.h
//  Sabores
//
//  Created by Michel Goñi on 20/3/15.
//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface TouchesHexagon : SKNode

@property (copy, nonatomic) NSString *saborID;

@property (strong, nonatomic) SKShapeNode *hexagono;
@property (strong, nonatomic) SKShapeNode *line1;
@property (strong, nonatomic) SKShapeNode *line2;
@property (strong, nonatomic) SKShapeNode *line3;

@property (strong, nonatomic) SKLabelNode *hexagonLabelName;

-(instancetype)initWithColor: (int) color;

@end
