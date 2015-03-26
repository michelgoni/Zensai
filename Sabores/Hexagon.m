//
//  Touches.m
//  Sabores
//
//  Created by Michel Goñi on 20/3/15.
//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import "Hexagon.h"
#import "Sabor.h"
#import "Ingrediente.h"
#import "AppDataStack.h"

@interface Hexagon  ()

@property (strong, nonatomic) SKLabelNode *saborLabel;
@property (strong, nonatomic) SKLabelNode *ingredienteLabel;
@property (strong, nonatomic) SKLabelNode *matchingIngredient1;
@property (strong, nonatomic) SKLabelNode *matchingIngredient2;

@end

@implementation Hexagon


-(instancetype) initWithColor:(int)color {
    
    if (self = [super init]) {
        
        [self createHexagon:color];
    }
    return  self;
}



-(void) createHexagon:(int)color {
    
    
    
    self.hexagono = [SKShapeNode node];
    UIBezierPath* polygonPath = UIBezierPath.bezierPath;
    [polygonPath moveToPoint: CGPointMake(51.62, 117.25)];
    [polygonPath addLineToPoint: CGPointMake(93.09, 93.31)];
    [polygonPath addLineToPoint: CGPointMake(93.09, 45.44)];
    [polygonPath addLineToPoint: CGPointMake(51.62, 21.5)];
    [polygonPath addLineToPoint: CGPointMake(10.16, 45.44)];
    [polygonPath addLineToPoint: CGPointMake(10.16, 93.31)];
    [polygonPath closePath];
    
    
    self.hexagono.path = polygonPath.CGPath;
    self.hexagono.lineWidth = 1;
    self.hexagono.zPosition = 10;
    self.hexagono.name = @"";




    
    NSArray *colores =     @[[SKColor colorWithRed: 155/255.0 green:89/255.0 blue:182/255.0 alpha:1.0],
                             [SKColor colorWithRed: 211/255.0 green:84/255.0 blue:0/255.0 alpha:1.0],
                             [SKColor colorWithRed: 241/ 255.0  green: 196/255.0  blue:15/255.0 alpha: 1],
                             [SKColor colorWithRed: 243/255.0 green:156/255.0 blue: 18/255.0 alpha: 1],
                             [SKColor colorWithRed: 39/255.0 green: 174/255.0 blue: 96/255.0  alpha: 1],
                             [SKColor colorWithRed: 149/255.0 green:165/255.0 blue:166/255.0 alpha:1.0],
                            [SKColor colorWithRed: 230/255.0 green: 126/255.0  blue: 34/255.0  alpha: 1],
                             [SKColor colorWithRed: 211/255.0 green:84/255.0 blue:0/255.0 alpha:1.0]];
    
    

    
        self.hexagono.strokeColor = colores [color] ;

        
    
    [self addChild:self.hexagono];

 
    


}






@end
