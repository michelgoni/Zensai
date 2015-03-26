//
//  CreateFlavourLabel.m
//  Sabores
//
//  Created by Michel Goñi on 20/3/15.
//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import "FlavourLabel.h"
#import "Sabor.h"
#import "AppDataStack.h"



@implementation FlavourLabel

-(instancetype) initWithColor:(int)color {
    
    if (self = [super init]) {
        
        [self createLabelFlavours:color];
    }
    return  self;
}






-(void) createLabelFlavours: (int) color {
    

        
        self.flavourLabelName = [SKLabelNode labelNodeWithFontNamed:@"Optima"];
        self.flavourLabelName.alpha = 1.0;
        self.flavourLabelName.fontSize = 22;
        

    
    
    NSArray *colores =     @[[SKColor colorWithRed: 155/255.0 green:89/255.0 blue:182/255.0 alpha:1.0],
                             [SKColor colorWithRed: 211/255.0 green:84/255.0 blue:0/255.0 alpha:1.0],
                             [SKColor colorWithRed: 241/ 255.0  green: 196/255.0  blue:15/255.0 alpha: 1],
                             [SKColor colorWithRed: 243/255.0 green:156/255.0 blue: 18/255.0 alpha: 1],
                             [SKColor colorWithRed: 39/255.0 green: 174/255.0 blue: 96/255.0  alpha: 1],
                             [SKColor colorWithRed: 149/255.0 green:165/255.0 blue:166/255.0 alpha:1.0],
                             [SKColor colorWithRed: 230/255.0 green: 126/255.0  blue: 34/255.0  alpha: 1],
                             [SKColor colorWithRed: 211/255.0 green:84/255.0 blue:0/255.0 alpha:1.0]];
    
                               

    
        self.flavourLabelName.fontColor = colores [color];

        self.flavourLabelName.zPosition = 10;
        [self addChild:self.flavourLabelName];
    
    

}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [super touchesBegan:touches withEvent:event];
}



@end
