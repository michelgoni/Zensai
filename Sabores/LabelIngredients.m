//
//  CreateLabelIngredients.m
//  Sabores
//
//  Created by Michel Goñi on 20/3/15.
//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import "LabelIngredients.h"

@interface LabelIngredients  ()


@end

@implementation LabelIngredients

-(instancetype) init {
    
    if (self = [super init]) {
        
        [self createLabelIngredients];
    }
    return  self;
}



-(void) createLabelIngredients {
    

    self.ingredientLabelName= [SKLabelNode labelNodeWithFontNamed:@"Optima"];
    self.ingredientLabelName.alpha = 1.0;
    self.ingredientLabelName.fontSize = 15;
    self.ingredientLabelName.fontColor = [SKColor colorWithRed:1 green:0.688 blue:0 alpha:1];
    self.ingredientLabelName.zPosition = 10;

    
    
    [self addChild: self.ingredientLabelName];
}

@end
