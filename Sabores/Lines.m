//
//  Lines.m
//  Sabores
//
//  Created by Michel Goñi on 25/3/15.
//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import "Lines.h"

@implementation Lines

-(instancetype) initWithColor:(int)color {
    
    if (self = [super init]) {
        
        [self createLines:color];
    }
    return  self;
}



-(void) createLines:(int)color {
    
    
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
    self.line1.alpha = 1.0;
    
    
    
    self.line2.path = bezier2Path.CGPath;
    self.line2.lineWidth = 1;
    self.line2.zPosition = 10;
    self.line2.alpha = 1.0;
    
    
    self.line3.path = bezier3Path.CGPath;
    self.line3.lineWidth = 1;
    self.line3.zPosition = 10;
    self.line3.alpha = 1.0;
    
    
    NSArray *colores =     @[[SKColor colorWithRed: 155/255.0 green:89/255.0 blue:182/255.0 alpha:1.0],
                             [SKColor colorWithRed: 211/255.0 green:84/255.0 blue:0/255.0 alpha:1.0],
                             [SKColor colorWithRed: 241/ 255.0  green: 196/255.0  blue:15/255.0 alpha: 1],
                             [SKColor colorWithRed: 243/255.0 green:156/255.0 blue: 18/255.0 alpha: 1],
                             [SKColor colorWithRed: 39/255.0 green: 174/255.0 blue: 96/255.0  alpha: 1],
                             [SKColor colorWithRed: 149/255.0 green:165/255.0 blue:166/255.0 alpha:1.0],
                             [SKColor colorWithRed: 230/255.0 green: 126/255.0  blue: 34/255.0  alpha: 1],
                             [SKColor colorWithRed: 211/255.0 green:84/255.0 blue:0/255.0 alpha:1.0]];
    
    
    
    self.line1.strokeColor = colores [color];
    self.line2.strokeColor = colores [color];
    self.line3.strokeColor = colores [color];
    
    [self addChild:self.line1];
    [self addChild:self.line2];
    [self addChild:self.line3];
    
    

    
    
}

@end
