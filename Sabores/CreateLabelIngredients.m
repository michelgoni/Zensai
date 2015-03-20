//
//  CreateLabelIngredients.m
//  Sabores
//
//  Created by Michel Goñi on 20/3/15.
//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import "CreateLabelIngredients.h"

@interface CreateLabelIngredients  ()

@property (strong, nonatomic) SKLabelNode *ingredienteLabel;

@end

@implementation CreateLabelIngredients

-(instancetype) init {
    
    if (self = [super init]) {
        
        [self createLabelIngredients];
    }
    return  self;
}

-(void) createLabelIngredients {
    
    SKLabelNode *ingredienteLabel = [SKLabelNode labelNodeWithFontNamed:@"Optima"];
    ingredienteLabel.alpha = 1.0;
    ingredienteLabel.text = @"Ingredient";
    //self.ingredienteLabel.name = ingrediente.name;
    ingredienteLabel.fontSize = 16;
    ingredienteLabel.fontColor = [SKColor colorWithRed:1 green:0.688 blue:0 alpha:1];
    
//    CGFloat y = 0;
//    if (j == 1) {
//        y = -27;
//    }
    //self.ingredienteLabel.position = CGPointMake ((j*37) + hexagono.position.x +10 , y + hexagono.position.y +5);
    ingredienteLabel.zPosition = 10;
    [self addChild: ingredienteLabel];
}

@end
