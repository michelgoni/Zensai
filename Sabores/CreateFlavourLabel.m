//
//  CreateFlavourLabel.m
//  Sabores
//
//  Created by Michel Goñi on 20/3/15.
//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import "CreateFlavourLabel.h"

@interface CreateFlavourLabel  ()


@end

@implementation CreateFlavourLabel

-(instancetype) init {
    
    if (self = [super init]) {
        
        [self createLabelFlavours];
    }
    return  self;
}

-(void) createLabelFlavours {
    
    SKLabelNode *saborLabel = [SKLabelNode labelNodeWithFontNamed:@"Optima"];
    saborLabel.alpha = 1.0;
    saborLabel.text = @"Hi";
    //self.saborLabel.name = sabor.name;
    saborLabel.fontSize = 22;
    saborLabel.fontColor = [SKColor colorWithRed:1 green:0.688 blue:0 alpha:1];
    //self.saborLabel.position = CGPointMake (hexagono.position.x +48 , hexagono.position.y +45);
    saborLabel.zPosition = 10;
    [self addChild:saborLabel];
}


@end
