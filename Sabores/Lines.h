//
//  Lines.h
//  Sabores
//
//  Created by Michel Goñi on 25/3/15.
//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Lines : SKNode

@property (strong, nonatomic) SKShapeNode *line1;
@property (strong, nonatomic) SKShapeNode *line2;
@property (strong, nonatomic) SKShapeNode *line3;


-(instancetype)initWithColor: (int) color;


@end
