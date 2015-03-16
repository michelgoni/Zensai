//
//  GameScene.m
//  Sabores
//
//  Created by Michel Goñi on 16/3/15.
//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import "GameScene.h"
#import <UIKit/UIKit.h>

@interface GameScene()




@end

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    
  
    [self createNode1];
    [self createNode2];
    [self createNode3];
    //[self moveHexagon];
    
    //self createNode1:CGPointMake(0, 0);

}

#pragma mark -Node1
-(void) createNode1:(CGPoint)point {
    
    SKNode *shapeParentNode = [self childNodeWithName:@"Node1"];
    
    
    SKShapeNode *hexagono = [SKShapeNode node];
    hexagono.name = @"terroso";
    
    UIBezierPath* polygonPath = UIBezierPath.bezierPath;
    [polygonPath moveToPoint: CGPointMake(point.x + 45.94, point.y + 2.25)];
    //[polygonPath moveToPoint: CGPointMake( 45.94, 2.25)];
    [polygonPath addLineToPoint: CGPointMake(87.78, 23.09)];
    [polygonPath addLineToPoint: CGPointMake(87.78, 64.78)];
    [polygonPath addLineToPoint: CGPointMake(45.94, 85.62)];
    [polygonPath addLineToPoint: CGPointMake(4.1, 64.78)];
    [polygonPath addLineToPoint: CGPointMake(4.1, 23.09)];
    [polygonPath closePath];
    
    
    hexagono.path = polygonPath.CGPath;
    hexagono.lineWidth = 1;
    hexagono.strokeColor = [SKColor colorWithRed:1 green:0.688 blue:0 alpha:1];
    
    
    [shapeParentNode addChild:hexagono];
    
    
    //Label terreoso
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Optima"];
    myLabel.alpha = 1.0;
    myLabel.text = @"Terroso";
    myLabel.name = @"TerrosoLabel";
    myLabel.fontSize = 19;
    myLabel.fontColor = [SKColor colorWithRed:1 green:0.688 blue:0 alpha:1];
    myLabel.position = CGPointMake (hexagono.position.x +40 , hexagono.position.y +30);
    myLabel.zPosition = 10;
    
    
    [shapeParentNode addChild:myLabel];
    
    
    
}

#pragma  mark -Node 2

-(void) createNode2 {
    
    SKNode *shapeParentNode2 = [self childNodeWithName:@"Node2"];
    
    SKShapeNode *hexagono2 = [SKShapeNode node];
    hexagono2.name = @"mar";
    
    UIBezierPath* polygonPath = UIBezierPath.bezierPath;
    [polygonPath moveToPoint: CGPointMake(45.94, 2.25)];
    [polygonPath addLineToPoint: CGPointMake(87.78, 23.09)];
    [polygonPath addLineToPoint: CGPointMake(87.78, 64.78)];
    [polygonPath addLineToPoint: CGPointMake(45.94, 85.62)];
    [polygonPath addLineToPoint: CGPointMake(4.1, 64.78)];
    [polygonPath addLineToPoint: CGPointMake(4.1, 23.09)];
    [polygonPath closePath];
    
    
    hexagono2.path = polygonPath.CGPath;
    hexagono2.lineWidth = 1;
    hexagono2.strokeColor = [SKColor colorWithRed: 0.49 green: 0.636 blue: 0.739 alpha: 1];
    
    
    [shapeParentNode2 addChild:hexagono2];
    
    //Label mar
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Optima"];
    myLabel.name = @"MarLabel";
    myLabel.alpha = 1.0;
    myLabel.text = @"Mar";
    myLabel.fontSize = 19;
    myLabel.fontColor = [SKColor colorWithRed: 0.49 green: 0.636 blue: 0.739 alpha: 1];
    myLabel.position = CGPointMake (hexagono2.position.x +40 , hexagono2.position.y +30);
    myLabel.zPosition = 10;
    
    
    [shapeParentNode2 addChild:myLabel];
    

}

-(void) createNode3 {
    
    SKNode *shapeParentNode3 = [self childNodeWithName:@"Node3"];
    
    SKShapeNode *hexagono3 = [SKShapeNode node];
    hexagono3.name = @"Hierba&Verdura";
    
    UIBezierPath* polygonPath = UIBezierPath.bezierPath;
    [polygonPath moveToPoint: CGPointMake(45.94, 2.25)];
    [polygonPath addLineToPoint: CGPointMake(87.78, 23.09)];
    [polygonPath addLineToPoint: CGPointMake(87.78, 64.78)];
    [polygonPath addLineToPoint: CGPointMake(45.94, 85.62)];
    [polygonPath addLineToPoint: CGPointMake(4.1, 64.78)];
    [polygonPath addLineToPoint: CGPointMake(4.1, 23.09)];
    [polygonPath closePath];
    
    
    hexagono3.path = polygonPath.CGPath;
    hexagono3.lineWidth = 1;
    hexagono3.strokeColor = [SKColor colorWithRed: 0.269 green: 0.53 blue: 0.269 alpha: 1];
    
    
    [shapeParentNode3 addChild:hexagono3];
    
    //Label Hierba
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Optima"];
    myLabel.name = @"Hierba & Verdura";
    myLabel.alpha = 1.0;
    myLabel.text = @"Hierba";
    myLabel.fontSize = 19;
    myLabel.fontColor = [SKColor colorWithRed: 0.269 green: 0.53 blue: 0.269 alpha: 1];
    myLabel.position = CGPointMake (hexagono3.position.x +40 , hexagono3.position.y +30);
    myLabel.zPosition = 10;
    
    
    [shapeParentNode3 addChild:myLabel];
    
    
}




#pragma  mark-Animaciones

//Método para animar el hexágono

-(void) moveHexagon {
    
    SKNode *shapeParentNode = [self childNodeWithName:@"Node1"];
    SKAction *move = [SKAction moveBy:CGVectorMake(arc4random()%10, arc4random()%15) duration:3];
    SKAction *reseversedMove = [move reversedAction];
    SKAction *moveSeq = [SKAction sequence:@[ move, reseversedMove]];
    SKAction* groupAction = [SKAction group:@[moveSeq]];
    SKAction* repeatSize = [SKAction repeatActionForever:groupAction];
    repeatSize.timingMode = SKActionTimingEaseIn;

    [shapeParentNode runAction:repeatSize];
    
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
    
    for (UITouch* touch in touches){
        
        CGPoint p = [touch locationInNode:self];
        
        
        SKNode *node = [self.scene nodeAtPoint:p];
        
        
        NSLog(@"touched on something called %@",node.name);
        
        
        if ([node.name isEqualToString:@"Node1"]){
            
            NSLog(@"Nodo 1 tocado");
            
            // OJO PORQUE SI EL NODO ES TRANSPARENTE (NO HAY CONTENIDO) NO DETECTA LAS ZONAS DONDE NO HAY NADA!
            // EN EL DISPOSITIVO NO SE NOTA TANTO PORQUE EL DEDO ES GORDO Y CUANDO PULSAS EL HEXAGONO
            // PISAS TODO, PERO EN EL SIMULADOR CON EL MOUSE ES FÁCIL QUE NO TE DETECTE NADA
            // PRUEBA Y AJUSTA, PERO ESTO FUNCIONA OK...
        }
        
        
    }
    
    
    
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
