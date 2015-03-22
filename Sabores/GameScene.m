//
//  GameScene.m
//  Sabores
//
//  Created by Michel Goñi on 16/3/15.
//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import "GameScene.h"
#import <UIKit/UIKit.h>
#import "AppDataStack.h"
#import "Matching.h"
#import "Sabor.h"
#import "Ingrediente.h"
#import <CoreData/CoreData.h>
#import "SKEase.h"
#import "TouchesHexagon.h"
#import "CreateFlavourLabel.h"
#import "CreateLabelIngredients.h"





@interface GameScene()

@property (strong, nonatomic) NSManagedObjectContext *context;

@property (strong, nonatomic) SKNode *node;
@property (strong, nonatomic) SKNode *flavourLabelNode;
@property (strong, nonatomic) SKNode *ingredientLabelNode;

@property (strong, nonatomic) SKNode *shapeParentNode;
@property (strong, nonatomic) SKLabelNode *saborLabel;
@property (strong, nonatomic) SKLabelNode *ingredienteLabel;
@property (strong, nonatomic) SKLabelNode *matchingIngredient1;
@property (strong, nonatomic) SKLabelNode *matchingIngredient2;
@property (strong, nonatomic) SKShapeNode *hexagono;


@property (strong, nonatomic) TouchesHexagon *touches;
@property (strong, nonatomic) CreateFlavourLabel *labelFlavour;
@property (strong, nonatomic) CreateLabelIngredients *labelIngredients;


@end

@implementation GameScene {
    
    int touchNumber;
}

-(void)didMoveToView:(SKView *)view {
    
    [self loadSabores];
    //[self createNode1];
    //[self testMatching];
    //[self moveHexagon];
    [self createHexagons];
    [self createIngredientsLabel];
    
    
    touchNumber = 0;
    //
    //    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget: self action:@selector(handleTap:)];
    //
    //    [view addGestureRecognizer: tap];
    
}


-(void) createHexagons {
    int i = 0;
    for (Sabor *sabor in self.flavours) {
        
        NSLog(@"-----------Flavour name: %@", sabor.name);
        _touches = [TouchesHexagon node];
        self.node = [self childNodeWithName:[NSString stringWithFormat:@"Node%d", i]];
        [self.node addChild:_touches];
    
        _labelFlavour = [CreateFlavourLabel node];
        self.labelFlavour.flavourLabelName.text = sabor.name;
        self.flavourLabelNode = [self childNodeWithName:[NSString stringWithFormat:@"flavourLabel%d", i]];
        [self.flavourLabelNode addChild:_labelFlavour];
        i++;
        
         }
}

-(void) createIngredientsLabel {
    
    int j = 0;
    for (Sabor *sabor in self.flavours ) {
        
        for (Ingrediente *ingrediente in sabor.ingredientes) {
            NSLog(@"--------------ingrediente name: %@", ingrediente.name);
            
            _labelIngredients = [CreateLabelIngredients node];
            self.labelIngredients.ingredientLabelName.text = ingrediente.name;
            self.ingredientLabelNode = [self childNodeWithName:[NSString stringWithFormat:@"ingredientLabel%d", j]];
            self.labelIngredients.ingredientLabelName.text = ingrediente.name;
            self.labelIngredients.ingredientLabelName.name = ingrediente.identifier;
            [self.ingredientLabelNode addChild:_labelIngredients];
            j++;
        }
    }
}
        


//-(void) handleTap:( UITapGestureRecognizer *) sender {
//
//            CGPoint touchLocation = [sender locationInView:sender.view];
//            touchLocation = [self convertPointFromView:touchLocation];
//            SKNode *touchedNode = (SKNode *)[self nodeAtPoint:touchLocation];
//
//            NSLog(@"Finishing touching in %@", touchedNode);
//
//    if ([touchedNode.name isEqualToString:@"Hexagono3"]){
//
//        NSLog(@"Toucyhed Hexagono 3");
//        self.ingredienteLabel.fontSize =80;
//    }
//
//
//}


-(void) loadSabores
{
    self.flavours = [Sabor allSaboresInContext:self.context];
    
    self.ingredients = [Ingrediente allIngredientsInContext:self.context];
}

-(void) testMatching {
    
    self.matchingIngredient1 = [SKLabelNode labelNodeWithFontNamed:@"Optima"];
    
    self.matchingIngredient1.text = @"Hey";
    self.matchingIngredient1.name = @"";
    self.matchingIngredient1.alpha = 1.0;
    self.matchingIngredient1.fontSize = 18;
    self.matchingIngredient1.zPosition = 10;
    self.matchingIngredient1.position = CGPointMake(CGRectGetMidX(self.frame) ,
                                                    CGRectGetMidY(self.frame) +90);
    
    [self addChild:self.matchingIngredient1];
    
    
    self.matchingIngredient2 = [SKLabelNode labelNodeWithFontNamed:@"Optima"];
    
    self.matchingIngredient2.text = @"";
    self.matchingIngredient2.name = @"";
    self.matchingIngredient2.fontSize = 18;
    self.matchingIngredient1.alpha = 1.0;
    self.matchingIngredient2.zPosition = 10;
    self.matchingIngredient2.position = CGPointMake(self.matchingIngredient1.position.x, self.matchingIngredient1.position.y -140);
    
    [self addChild:self.matchingIngredient2];
    
    
}



//#pragma mark -Create nodes
//-(void) createNode1 {
//    
//    
//    int i = 0;
//    //Colors array to be refactored
//    NSArray *colores =      @[[SKColor colorWithRed:192/255.0f green:57/255.0f blue:43/255.0f alpha:1.0f],
//                              [SKColor colorWithRed: 0.5 green: 0.2 blue: 0.13 alpha: 1],
//                              [SKColor colorWithRed: 0.844 green: 0.157 blue: 0.157 alpha: 1],
//                              [SKColor colorWithRed: 0.844 green: 0.157 blue: 0.157 alpha: 1],
//                              [SKColor colorWithRed: 0.2 green: 0.157 blue: 0.4 alpha: 1],
//                              [SKColor colorWithRed: 0.844 green: 0.157 blue: 0.157 alpha: 1],
//                              [SKColor colorWithRed: 0.5 green: 0.157 blue: 0.157 alpha: 1],
//                              [SKColor colorWithRed: 0.844 green: 0.157 blue: 0.157 alpha: 1],
//                              [SKColor colorWithRed: 0.844 green: 0.157 blue: 0.157 alpha: 1],
//                              [SKColor colorWithRed: 1 green: 0.3 blue: 0.157 alpha: 1]];
//    
//    
//    
//    for (Sabor *sabor in self.flavours) {
//        
//        
//        NSLog(@"-----------Flavour name: %@", sabor.name);
//        
//        
//        // Crear uno a uno el hexágono
//        self.shapeParentNode = [self childNodeWithName:[NSString stringWithFormat:@"Node%d", i]];
//        
//        
//        self.hexagono = [SKShapeNode node];
//        self.hexagono.name = [NSString stringWithFormat:@"Hexagono%d", i];
//        UIBezierPath* polygonPath = UIBezierPath.bezierPath;
//        [polygonPath moveToPoint: CGPointMake(51.62, 117.25)];
//        [polygonPath addLineToPoint: CGPointMake(93.09, 93.31)];
//        [polygonPath addLineToPoint: CGPointMake(93.09, 45.44)];
//        [polygonPath addLineToPoint: CGPointMake(51.62, 21.5)];
//        [polygonPath addLineToPoint: CGPointMake(10.16, 45.44)];
//        [polygonPath addLineToPoint: CGPointMake(10.16, 93.31)];
//        [polygonPath closePath];
//        
//        
//        self.hexagono.path = polygonPath.CGPath;
//        self.hexagono.lineWidth = 1;
//        self.hexagono.zPosition = 10;
//        self.hexagono.strokeColor = colores [i];
//        
//        
//        
//        
//        SKShapeNode *line1 = [SKShapeNode node];
//        UIBezierPath* bezierPath = UIBezierPath.bezierPath;
//        [bezierPath moveToPoint: CGPointMake( 10.5,  20.5)];
//        [bezierPath addLineToPoint: CGPointMake(10.5,  45.5)];
//        [bezierPath addLineToPoint: CGPointMake( 10.5,  45.5)];
//        [bezierPath addLineToPoint: CGPointMake( 10.5,  45.5)];
//        
//        SKShapeNode *line2 = [SKShapeNode node];
//        UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
//        [bezier2Path moveToPoint: CGPointMake( 51.5, 21.5)];
//        [bezier2Path addCurveToPoint: CGPointMake(50.5, -9.5) controlPoint1: CGPointMake(50.5, -9.5) controlPoint2: CGPointMake(50.5, -9.5)];
//        
//        SKShapeNode *line3 = [SKShapeNode node];
//        UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
//        [bezier3Path moveToPoint: CGPointMake( 93.5,  45.5)];
//        [bezier3Path addCurveToPoint: CGPointMake( 93.5, 20.5) controlPoint1: CGPointMake(93.5, 20.5) controlPoint2: CGPointMake(93.5,  20.5)];
//        
//        line1.path = bezierPath.CGPath;
//        line1.zPosition = 10;
//        line1.lineWidth = 1;
//        line1.strokeColor = colores [i];
//        line1.alpha = 1.0;
//        
//        
//        line2.path = bezier2Path.CGPath;
//        line2.lineWidth = 1;
//        line2.zPosition = 10;
//        line2.strokeColor = colores [i];
//        line2.alpha = 1.0;
//        
//        line3.path = bezier3Path.CGPath;
//        line3.lineWidth = 1;
//        line3.zPosition = 10;
//        line3.strokeColor = colores [i];
//        line3.alpha = 1.0;
//        
//        
//        [self.shapeParentNode  addChild:self.hexagono];
//        [self.shapeParentNode  addChild:line1];
//        [self.shapeParentNode  addChild:line2];
//        [self.shapeParentNode  addChild:line3];
//        i++;
//        
//        //Label sabor
//        
//        self.saborLabel = [SKLabelNode labelNodeWithFontNamed:@"Optima"];
//        self.saborLabel.alpha = 1.0;
//        self.saborLabel.text = sabor.name;
//        self.saborLabel.fontSize = 22;
//        self.saborLabel.fontColor = [SKColor colorWithRed:1 green:0.688 blue:0 alpha:1];
//        self.saborLabel.position = CGPointMake (self.hexagono.position.x +48 , self.hexagono.position.y +45);
//        self.saborLabel.zPosition = 10;
//        
//        
//        [self.shapeParentNode  addChild:self.saborLabel];
//        
//        
//        //Label ingrediente
//        int j = 0;
//        for (Ingrediente *ingrediente in sabor.ingredientes) {
//            NSLog(@"--------------ingrediente name: %@", ingrediente.identifier);
//            //Ingredientes labels
//            self.ingredienteLabel = [SKLabelNode labelNodeWithFontNamed:@"Optima"];
//            self.ingredienteLabel.alpha = 1.0;
//            
//            
//            self.ingredienteLabel.text = ingrediente.name;
//            self.ingredienteLabel.name = ingrediente.identifier;
//            self.ingredienteLabel.fontSize = 16;
//            self.ingredienteLabel.fontColor = [SKColor colorWithRed:1 green:0.688 blue:0 alpha:1];
//            
//            
//            CGFloat y = 0;
//            if (j == 1) {
//                y = -27;
//            }
//            
//            self.ingredienteLabel.position = CGPointMake ((j*37) + self.hexagono.position.x +10 , y + self.hexagono.position.y +5);
//            self.ingredienteLabel.zPosition = 10;
//            
//            [self.shapeParentNode  addChild:self.ingredienteLabel];
//            
//            
//            j++;
//        }
//    }
//}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (touchNumber == 0) {
        
        //Entramos en el primer toque
        for (UITouch* touch in touches){
            
            
            
            CGPoint p = [touch locationInNode:self];
            SKNode *nodeK = [self.scene nodeAtPoint:p];
            
            SKAction *bounce2 = [SKEase ScaleFromWithNode:nodeK EaseFunction:CurveTypeBounce
                                                     Mode:ElasticEaseInOut(5)
                                                     Time:0.2
                                                FromValue:2.2];
            
            
            self.matchingIngredient1.text = nodeK.name;
            self.matchingIngredient1.name  = nodeK.name;
            [self.matchingIngredient1 runAction:bounce2];
            
            NSLog(@"Touched someting called %@", nodeK.name);
            
            
        }
        touchNumber ++;
        
    }else if (touchNumber == 1) {
        
        //Entramos en el segundo toque
        for (UITouch* touch in touches){
            CGPoint p = [touch locationInNode:self];
            SKNode *node2 = [self.scene nodeAtPoint:p];
            
            self.matchingIngredient2.text = node2.name;
            self.matchingIngredient2.name = node2.name;
            
            
            
            SKAction *bounce2 = [SKEase ScaleFromWithNode:node2 EaseFunction:CurveTypeBounce
                                                     Mode:ElasticEaseInOut(5)
                                                     Time:0.2
                                                FromValue:2.2];
            [self.matchingIngredient2 runAction:bounce2];
            
            
            
            touchNumber = 0;
            
            if (self.matchingIngredient1.name && self.matchingIngredient2.name) {
                
                Ingrediente *ingrediente1 = [Ingrediente ingredienteById:self.matchingIngredient1.name inContext:self.context];
                Ingrediente *ingrediente2 = [Ingrediente ingredienteById:self.matchingIngredient2.name inContext:self.context];
                
                if (ingrediente1 && ingrediente2) {
                    Matching *matching = [Matching matchingWithIngredient:ingrediente1 ingrediente:ingrediente2 inContext:self.context];
                    
                    if (matching) {
                        if (matching.good) {
                            //Make action for GOOD matching
                            NSLog(@"Good matching between %@ and %@", ingrediente1.name, ingrediente2.name);
                            
                        } else {
                            //Make action for BAD matching
                            NSLog(@"Bad matching between %@ and %@", ingrediente1.name, ingrediente2.name);
                            
                        }
                        
                    } else {
                        // MAke action for NOT matching found
                        NSLog(@"No matching between %@ and %@", ingrediente1.name, ingrediente2.name);
                        
                    }
                } else {
                    // We hava a problem
                    NSLog(@"Problem with ingredients with names %@ and %@", self.matchingIngredient1.name, self.matchingIngredient1.name);
                    
                }
            }
            
        }
        
    }
}





#pragma  mark-Animaciones

//Método para animar el hexágono

-(void) moveHexagon {
    
    for (int i = 0; i< 9; i++) {
        SKNode *shapeParentNode = [self childNodeWithName:[NSString stringWithFormat:@"Node%d", i]];
        SKAction *move = [SKAction moveBy:CGVectorMake(arc4random()%10, arc4random()%15) duration:3];
        //        SKAction *scaleY = [SKAction scaleYTo:(arc4random()%7) duration:4];
        //        SKAction *scaleX = [SKAction scaleYTo:(arc4random()%7) duration:4];
        SKAction *reseversedMove = [move reversedAction];
        SKAction *moveSeq = [SKAction sequence:@[ move, reseversedMove]];
        SKAction* groupAction = [SKAction group:@[moveSeq]];
        SKAction* repeatSize = [SKAction repeatActionForever:groupAction];
        repeatSize.timingMode = SKActionTimingEaseIn;
        
        [shapeParentNode runAction:repeatSize];
    }
    
}




-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

-(NSManagedObjectContext *)context {
    if (!_context) {
        AppDataStack *stack = [[AppDataStack alloc] init];
        _context = stack.context;
    }
    return _context;
}



@end
