//
//  Touches.m
//  Sabores
//
//  Created by Michel Goñi on 20/3/15.
//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import "TouchesHexagon.h"

@implementation TouchesHexagon

-(void) createHexagon {
    
    
    SKNode *shapeParentNode = [self childNodeWithName:@"Node0"];
    
    
    SKShapeNode *hexagono = [SKShapeNode node];
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
    hexagono.position = CGPointMake(400, 300);
    
    [shapeParentNode addChild:hexagono];
}

@end
