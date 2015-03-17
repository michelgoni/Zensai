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
    [self createNode4];
    [self createNode5];
    [self createNode6];
    [self createNode7];
    [self createNode8];
    //[self moveHexagon];
    


}

#pragma mark -Node1
-(void) createNode1 {
    
    SKNode *shapeParentNode = [self childNodeWithName:@"Node1"];
    
    
    SKShapeNode *hexagono = [SKShapeNode node];
    hexagono.name = @"terroso";
    
    UIBezierPath* polygonPath = UIBezierPath.bezierPath;
    [polygonPath moveToPoint: CGPointMake( 45.94, 2.25)];
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
#pragma  mark -Node 2
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

#pragma  mark -Node 4
-(void) createNode4 {
    
    SKNode *shapeParentNode4 = [self childNodeWithName:@"Node4"];
    
    SKShapeNode *hexagono4 = [SKShapeNode node];
    hexagono4.name = @"Especias";
    
    UIBezierPath* polygonPath = UIBezierPath.bezierPath;
    [polygonPath moveToPoint: CGPointMake(45.94, 2.25)];
    [polygonPath addLineToPoint: CGPointMake(87.78, 23.09)];
    [polygonPath addLineToPoint: CGPointMake(87.78, 64.78)];
    [polygonPath addLineToPoint: CGPointMake(45.94, 85.62)];
    [polygonPath addLineToPoint: CGPointMake(4.1, 64.78)];
    [polygonPath addLineToPoint: CGPointMake(4.1, 23.09)];
    [polygonPath closePath];
    
    
    hexagono4.path = polygonPath.CGPath;
    hexagono4.lineWidth = 1;
    hexagono4.strokeColor = [SKColor colorWithRed: 0.726 green: 0.34 blue: 0.145 alpha: 1];
    
    
    [shapeParentNode4 addChild:hexagono4];
    
    //Label Especias
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Optima"];
    myLabel.name = @"Especias";
    myLabel.alpha = 1.0;
    myLabel.text = @"Especias";
    myLabel.fontSize = 19;
    myLabel.fontColor = [SKColor colorWithRed: 0.726 green: 0.34 blue: 0.145 alpha: 1];
    myLabel.position = CGPointMake (hexagono4.position.x +40 , hexagono4.position.y +30);
    myLabel.zPosition = 10;
    
    
    [shapeParentNode4 addChild:myLabel];
    
    
}

#pragma  mark -Node 5
-(void) createNode5 {
    
    SKNode *shapeParentNode5 = [self childNodeWithName:@"Node5"];
    
    SKShapeNode *hexagono5 = [SKShapeNode node];
    hexagono5.name = @"Salado";
    
    UIBezierPath* polygonPath = UIBezierPath.bezierPath;
    [polygonPath moveToPoint: CGPointMake(45.94, 2.25)];
    [polygonPath addLineToPoint: CGPointMake(87.78, 23.09)];
    [polygonPath addLineToPoint: CGPointMake(87.78, 64.78)];
    [polygonPath addLineToPoint: CGPointMake(45.94, 85.62)];
    [polygonPath addLineToPoint: CGPointMake(4.1, 64.78)];
    [polygonPath addLineToPoint: CGPointMake(4.1, 23.09)];
    [polygonPath closePath];
    
    
    hexagono5.path = polygonPath.CGPath;
    hexagono5.lineWidth = 1;
    hexagono5.strokeColor = [SKColor colorWithRed: 0.565 green: 0.787 blue: 0.863 alpha: 1];
    
    
    [shapeParentNode5 addChild:hexagono5];
    
    //Label Especias
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Optima"];
    myLabel.name = @"Salado";
    myLabel.alpha = 1.0;
    myLabel.text = @"Salado";
    myLabel.fontSize = 19;
    myLabel.fontColor = [SKColor colorWithRed: 0.565 green: 0.787 blue: 0.863 alpha: 1];
    myLabel.position = CGPointMake (hexagono5.position.x +40 , hexagono5.position.y +30);
    myLabel.zPosition = 10;
    
    
    [shapeParentNode5 addChild:myLabel];
    
    
}

#pragma  mark -Node 6
-(void) createNode6 {
    
    SKNode *shapeParentNode6 = [self childNodeWithName:@"Node6"];
    
    SKShapeNode *hexagono6 = [SKShapeNode node];
    hexagono6.name = @"Tostado";
    
    UIBezierPath* polygonPath = UIBezierPath.bezierPath;
    [polygonPath moveToPoint: CGPointMake(45.94, 2.25)];
    [polygonPath addLineToPoint: CGPointMake(87.78, 23.09)];
    [polygonPath addLineToPoint: CGPointMake(87.78, 64.78)];
    [polygonPath addLineToPoint: CGPointMake(45.94, 85.62)];
    [polygonPath addLineToPoint: CGPointMake(4.1, 64.78)];
    [polygonPath addLineToPoint: CGPointMake(4.1, 23.09)];
    [polygonPath closePath];
    
    
    hexagono6.path = polygonPath.CGPath;
    hexagono6.lineWidth = 1;
    hexagono6.strokeColor = [SKColor colorWithRed: 0.859 green: 0.455 blue: 0.093 alpha: 1];
    
    
    [shapeParentNode6 addChild:hexagono6];
    
    //Label Especias
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Optima"];
    myLabel.name = @"Tostado";
    myLabel.alpha = 1.0;
    myLabel.text = @"Tostado";
    myLabel.fontSize = 19;
    myLabel.fontColor = [SKColor colorWithRed: 0.859 green: 0.455 blue: 0.093 alpha: 1];
    myLabel.position = CGPointMake (hexagono6.position.x +40 , hexagono6.position.y +30);
    myLabel.zPosition = 10;
    
    
    [shapeParentNode6 addChild:myLabel];
    
    
}



#pragma  mark -Node 7
-(void) createNode7 {
    
    SKNode *shapeParentNode7 = [self childNodeWithName:@"Node7"];
    
    SKShapeNode *hexagono7 = [SKShapeNode node];
    hexagono7.name = @"Cítrico";
    
    UIBezierPath* polygonPath = UIBezierPath.bezierPath;
    [polygonPath moveToPoint: CGPointMake(45.94, 2.25)];
    [polygonPath addLineToPoint: CGPointMake(87.78, 23.09)];
    [polygonPath addLineToPoint: CGPointMake(87.78, 64.78)];
    [polygonPath addLineToPoint: CGPointMake(45.94, 85.62)];
    [polygonPath addLineToPoint: CGPointMake(4.1, 64.78)];
    [polygonPath addLineToPoint: CGPointMake(4.1, 23.09)];
    [polygonPath closePath];
    
    
    hexagono7.path = polygonPath.CGPath;
    hexagono7.lineWidth = 1;
    hexagono7.strokeColor = [SKColor colorWithRed: 0.859 green: 0.857 blue: 0.093 alpha: 1];
    
    
    [shapeParentNode7 addChild:hexagono7];
    
    //Label Especias
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Optima"];
    myLabel.name = @"Cítrico";
    myLabel.alpha = 1.0;
    myLabel.text = @"Cítrico";
    myLabel.fontSize = 19;
    myLabel.fontColor = [SKColor colorWithRed: 0.859 green: 0.857 blue: 0.093 alpha: 1];
    myLabel.position = CGPointMake (hexagono7.position.x +40 , hexagono7.position.y +30);
    myLabel.zPosition = 10;
    
    
    [shapeParentNode7 addChild:myLabel];
    
    
}

#pragma  mark -Node 8
-(void) createNode8 {
    
    SKNode *shapeParentNode8 = [self childNodeWithName:@"Node8"];
    
    SKShapeNode *hexagono8 = [SKShapeNode node];
    hexagono8.name = @"Carne";
    
    UIBezierPath* polygonPath = UIBezierPath.bezierPath;
    [polygonPath moveToPoint: CGPointMake(45.94, 2.25)];
    [polygonPath addLineToPoint: CGPointMake(87.78, 23.09)];
    [polygonPath addLineToPoint: CGPointMake(87.78, 64.78)];
    [polygonPath addLineToPoint: CGPointMake(45.94, 85.62)];
    [polygonPath addLineToPoint: CGPointMake(4.1, 64.78)];
    [polygonPath addLineToPoint: CGPointMake(4.1, 23.09)];
    [polygonPath closePath];
    
    
    hexagono8.path = polygonPath.CGPath;
    hexagono8.lineWidth = 1;
    hexagono8.strokeColor = [SKColor colorWithRed: 0.859 green: 0.857 blue: 0.093 alpha: 1];
    
    
    [shapeParentNode8 addChild:hexagono8];
    
    //Label Especias
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Optima"];
    myLabel.name = @"Carne";
    myLabel.alpha = 1.0;
    myLabel.text = @"Carne";
    myLabel.fontSize = 19;
    myLabel.fontColor = [SKColor colorWithRed: 0.859 green: 0.857 blue: 0.093 alpha: 1];
    myLabel.position = CGPointMake (hexagono8.position.x +40 , hexagono8.position.y +30);
    myLabel.zPosition = 10;
    
    
    [shapeParentNode8 addChild:myLabel];
    
    
}

#pragma  mark -Node 9
-(void) createNode9 {
    
    SKNode *shapeParentNode9 = [self childNodeWithName:@"Node9"];
    
    SKShapeNode *hexagono9 = [SKShapeNode node];
    hexagono9.name = @"Carne";
    
    UIBezierPath* polygonPath = UIBezierPath.bezierPath;
    [polygonPath moveToPoint: CGPointMake(45.94, 2.25)];
    [polygonPath addLineToPoint: CGPointMake(87.78, 23.09)];
    [polygonPath addLineToPoint: CGPointMake(87.78, 64.78)];
    [polygonPath addLineToPoint: CGPointMake(45.94, 85.62)];
    [polygonPath addLineToPoint: CGPointMake(4.1, 64.78)];
    [polygonPath addLineToPoint: CGPointMake(4.1, 23.09)];
    [polygonPath closePath];
    
    
    hexagono9.path = polygonPath.CGPath;
    hexagono9.lineWidth = 1;
    hexagono9.strokeColor = [SKColor colorWithRed: 0.859 green: 0.857 blue: 0.093 alpha: 1];
    
    
    [shapeParentNode9 addChild:hexagono9];
    
    //Label Especias
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Optima"];
    myLabel.name = @"Carne";
    myLabel.alpha = 1.0;
    myLabel.text = @"Carne";
    myLabel.fontSize = 19;
    myLabel.fontColor = [SKColor colorWithRed: 0.859 green: 0.857 blue: 0.093 alpha: 1];
    myLabel.position = CGPointMake (hexagono9.position.x +40 , hexagono9.position.y +30);
    myLabel.zPosition = 10;
    
    
    [shapeParentNode9 addChild:myLabel];
    
    
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
