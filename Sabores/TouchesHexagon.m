//
//  Touches.m
//  Sabores
//
//  Created by Michel Goñi on 20/3/15.
//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import "TouchesHexagon.h"
#import "Sabor.h"
#import "Ingrediente.h"
#import "AppDataStack.h"

@interface TouchesHexagon  ()

@property (strong, nonatomic) SKLabelNode *saborLabel;
@property (strong, nonatomic) SKLabelNode *ingredienteLabel;
@property (strong, nonatomic) SKLabelNode *matchingIngredient1;
@property (strong, nonatomic) SKLabelNode *matchingIngredient2;
@property (strong, nonatomic) NSManagedObjectContext *context;

@end

@implementation TouchesHexagon


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


    
    
    
    self.line1 = [SKShapeNode node];
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake( 10.5,  20.5)];
    [bezierPath addLineToPoint: CGPointMake(10.5,  45.5)];
    [bezierPath addLineToPoint: CGPointMake( 10.5,  45.5)];
    [bezierPath addLineToPoint: CGPointMake( 10.5,  45.5)];
    
    self.line2 = [SKShapeNode node];
    UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
    [bezier2Path moveToPoint: CGPointMake( 51.5, 21.5)];
    [bezier2Path addCurveToPoint: CGPointMake(50.5, -9.5) controlPoint1: CGPointMake(50.5, -9.5) controlPoint2: CGPointMake(50.5, -9.5)];
    
     self.line3 = [SKShapeNode node];
    UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
    [bezier3Path moveToPoint: CGPointMake( 93.5,  45.5)];
    [bezier3Path addCurveToPoint: CGPointMake( 93.5, 20.5) controlPoint1: CGPointMake(93.5, 20.5) controlPoint2: CGPointMake(93.5,  20.5)];
    
    self.line1.path = bezierPath.CGPath;
    self.line1.lineWidth = 1;
    self.line1.zPosition = 10;

    
    
    self.line2.path = bezier2Path.CGPath;
    self.line2.lineWidth = 1;
    self.line2.zPosition = 10;

    
    self.line3.path = bezier3Path.CGPath;
    self.line3.lineWidth = 1;
    self.line3.zPosition = 10;

    //Colorsrgb

    NSArray *colores =      @[[SKColor colorWithRed: 155/255.0 green:89/255.0 blue:182/255.0 alpha:1.0],
                              [SKColor colorWithRed: 211/255.0 green:84/255.0 blue:0/255.0 alpha:1.0],
                              [SKColor colorWithRed: 241/ 255.0  green: 196/255.0  blue:15/255.0 alpha: 1],
                              [SKColor colorWithRed: 243/255.0 green:156/255.0 blue: 18/255.0 alpha: 1],
                              [SKColor colorWithRed: 39/255.0 green: 174/255.0 blue: 96/255.0  alpha: 1],
                              [SKColor colorWithRed: 230/255.0 green: 126/255.0  blue: 34/255.0  alpha: 1],
                              [SKColor colorWithRed: 149/255.0 green:165/255.0 blue:166/255.0 alpha:1.0],
                              [SKColor colorWithRed: 189/255.0 green:195/255.0 blue:199/255.0 alpha:1.0],
                              [SKColor colorWithRed: 22/255.0 green: 160/255.0 blue: 133/255.0 alpha: 1],
                              [SKColor colorWithRed: 22/255.0 green: 160/255.0 blue: 133/255.0 alpha: 1]];
    

        
        self.hexagono.strokeColor = colores [color] ;
        self.line1.strokeColor = colores [color];
        self.line2.strokeColor = colores [color];
        self.line3.strokeColor = colores [color];
        
    
    [self addChild:self.hexagono];
    [self addChild:self.line1];
    [self addChild:self.line2];
    [self addChild:self.line3];
 
    


}






@end
