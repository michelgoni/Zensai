//
//  CreateFlavourLabel.m
//  Sabores
//
//  Created by Michel Goñi on 20/3/15.
//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import "CreateFlavourLabel.h"
#import "Sabor.h"
#import "AppDataStack.h"



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
    
    
        

        self.flavourLabelName = [SKLabelNode labelNodeWithFontNamed:@"Optima"];
        self.flavourLabelName.alpha = 1.0;
        self.flavourLabelName.fontSize = 22;
        self.flavourLabelName.fontColor = [SKColor colorWithRed:1 green:0.688 blue:0 alpha:1];
        self.flavourLabelName.zPosition = 10;
    
        [self addChild:self.flavourLabelName];
    
    

}



@end
