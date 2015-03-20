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

-(instancetype) init {
    
    if (self = [super init]) {
        
        [self createHexagon];
    }
    return  self;
}



-(void) createHexagon {
    
    
    
    SKShapeNode *hexagono = [SKShapeNode node];
    hexagono.name = [NSString stringWithFormat:@"Hexagono1"];
    UIBezierPath* polygonPath = UIBezierPath.bezierPath;
    [polygonPath moveToPoint: CGPointMake(51.62, 117.25)];
    [polygonPath addLineToPoint: CGPointMake(93.09, 93.31)];
    [polygonPath addLineToPoint: CGPointMake(93.09, 45.44)];
    [polygonPath addLineToPoint: CGPointMake(51.62, 21.5)];
    [polygonPath addLineToPoint: CGPointMake(10.16, 45.44)];
    [polygonPath addLineToPoint: CGPointMake(10.16, 93.31)];
    [polygonPath closePath];
    
    
    hexagono.path = polygonPath.CGPath;
    hexagono.lineWidth = 1;
    hexagono.strokeColor = [SKColor whiteColor];
    
    
    SKShapeNode *line1 = [SKShapeNode node];
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake( 10.5,  20.5)];
    [bezierPath addLineToPoint: CGPointMake(10.5,  45.5)];
    [bezierPath addLineToPoint: CGPointMake( 10.5,  45.5)];
    [bezierPath addLineToPoint: CGPointMake( 10.5,  45.5)];
    
    SKShapeNode *line2 = [SKShapeNode node];
    UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
    [bezier2Path moveToPoint: CGPointMake( 51.5, 21.5)];
    [bezier2Path addCurveToPoint: CGPointMake(50.5, -9.5) controlPoint1: CGPointMake(50.5, -9.5) controlPoint2: CGPointMake(50.5, -9.5)];
    
    SKShapeNode *line3 = [SKShapeNode node];
    UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
    [bezier3Path moveToPoint: CGPointMake( 93.5,  45.5)];
    [bezier3Path addCurveToPoint: CGPointMake( 93.5, 20.5) controlPoint1: CGPointMake(93.5, 20.5) controlPoint2: CGPointMake(93.5,  20.5)];
    
    line1.path = bezierPath.CGPath;
    line1.lineWidth = 1;
    line1.strokeColor = [SKColor whiteColor];

    
    
    line2.path = bezier2Path.CGPath;
    line2.lineWidth = 1;
    line2.strokeColor = [SKColor whiteColor];

    
    line3.path = bezier3Path.CGPath;
    line3.lineWidth = 1;
    line3.strokeColor = [SKColor whiteColor];

     [self addChild:hexagono];
     [self addChild:line1];
     [self addChild:line2];
     [self addChild:line3];
    


}
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    CGPoint touchLocation = [[touches anyObject] locationInNode:self];
    TouchesHexagon *touchedNode = (TouchesHexagon *) [self nodeAtPoint:touchLocation];
    
    if ([touchedNode isKindOfClass:[TouchesHexagon class]] == NO) return;
}







@end
