//
//  GameScene.m
//  Sabores
//
//  Created by Michel Goñi on 16/3/15.
//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import "GameScene.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "AppDataStack.h"
#import "Matching.h"
#import "Sabor.h"
#import "Ingrediente.h"
#import <CoreData/CoreData.h>
#import "SKEase.h"
#import "TouchesHexagon.h"
#import "CreateFlavourLabel.h"
#import "CreateLabelIngredients.h"
#import "MatchingGood.h"
#import "MatchingBad.h"
#import "Nomatching.h"

@interface GameScene() <UICollisionBehaviorDelegate>

@property (strong, nonatomic) NSManagedObjectContext *context;

@property (strong, nonatomic) SKNode *node;
@property (strong, nonatomic) SKNode *flavourLabelNode;
@property (strong, nonatomic) SKNode *ingredientLabelNode;
@property (strong, nonatomic) SKNode *shapeParentNode;

@property (strong, nonatomic) SKLabelNode *saborLabel;
@property (strong, nonatomic) SKLabelNode *ingredienteLabel;
@property (strong, nonatomic) SKLabelNode *matchingIngredient1;
@property (strong, nonatomic) SKLabelNode *matchingIngredient2;

@property (strong, nonatomic) TouchesHexagon *touches;
@property (strong, nonatomic) CreateFlavourLabel *labelFlavour;
@property (strong, nonatomic) CreateLabelIngredients *labelIngredients;
@end

@implementation GameScene {
    
    int touchNumber;
}

-(void)didMoveToView:(SKView *)view {
   
       touchNumber = 0;
    
    [self loadSabores];

    [self testMatching];
    //[self moveHexagon];
    [self createHexagons];
    [self createIngredientsLabel];
    
    
}


-(void) createHexagons {
    int i = 0;
    for (Sabor *sabor in self.flavours) {
        
        //Hexagonos
        NSLog(@"-----------Flavour name: %@", sabor.name);
        _touches = [TouchesHexagon node];
        _touches = [_touches initWithColor: i];
        self.node = (SKNode *)[self childNodeWithName:[NSString stringWithFormat:@"Node%d", i]];
        [self.node addChild:_touches];
    
        //Sabores
        _labelFlavour = [CreateFlavourLabel node];
        _labelFlavour = [_labelFlavour initWithColor:i];
        self.labelFlavour.flavourLabelName.text = sabor.name;
        self.labelFlavour.flavourLabelName.name = sabor.name;
        self.flavourLabelNode = (SKNode *)[self childNodeWithName:[NSString stringWithFormat:@"flavourLabel%d", i]];
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

            self.ingredientLabelNode = (SKNode *)[self childNodeWithName:[NSString stringWithFormat:@"ingredientLabel%d", j]];
            self.labelIngredients.ingredientLabelName.text = ingrediente.name;
            self.labelIngredients.ingredientLabelName.name = ingrediente.identifier;
            [self.ingredientLabelNode addChild:_labelIngredients];

           j++;
            
            
        }
    }
}
        


-(void) loadSabores
{
    self.flavours = [Sabor allSaboresInContext:self.context];
    
    self.ingredients = [Ingrediente allIngredientsInContext:self.context];
}

-(void) testMatching {
    
    self.matchingIngredient1 = [SKLabelNode labelNodeWithFontNamed:@"Optima"];
    
    self.matchingIngredient1.text = @"";
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



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (touchNumber == 0) {
        
        //Entramos en el primer toque
        for (UITouch* touch in touches){
            
            CGPoint p = [touch locationInNode:self];
            SKNode *nodeK = [self.scene nodeAtPoint:p];
            
            self.matchingIngredient1.text = nodeK.name;
            self.matchingIngredient1.name  = nodeK.name;
            
            SKAction *bounce2 = [SKEase ScaleFromWithNode:nodeK EaseFunction:CurveTypeBounce
                                                     Mode:ElasticEaseInOut(5)
                                                     Time:0.2
                                                FromValue:2.2];
            
            

            [self.matchingIngredient1 runAction:bounce2];
            [self.flavourLabelNode runAction:bounce2];
            
            NSLog(@"Touched someting called %@", nodeK.name);
            
            if ([nodeK.name isEqualToString:@"flavourLabel0"]){
                
                //Ejecutamos animación donde aparecen los ingredientes afrutados
                for (int i = 0; i< 3; i++) {
                
                SKNode *ingredientNode1 = [self childNodeWithName:[NSString stringWithFormat:@"ingredientLabel%d", i]];
                SKAction *bounce2 = [SKEase ScaleFromWithNode:nodeK EaseFunction:CurveTypeBounce
                                                             Mode:ElasticEaseInOut(5)
                                                             Time:0.2
                                                        FromValue:2.2];
                    
                    
                [ingredientNode1 runAction:bounce2];
                    
  
                }
                
            }
            
        }
        touchNumber ++;
        
    }else if (touchNumber == 1) {
        
        //Entramos en el segundo toque
        for (UITouch* touch in touches){
            CGPoint p = [touch locationInNode:self];
            SKNode *node2 = [self.scene nodeAtPoint:p];
            
            self.matchingIngredient2.text = node2.name;
            self.matchingIngredient2.name = node2.name;
            
            //Animación antes de pasar a la escena
            
            SKAction *bounce2 = [SKEase ScaleFromWithNode:node2 EaseFunction:CurveTypeBounce
                                                     Mode:ElasticEaseInOut(5)
                                                     Time:0.2
                                                FromValue:2.2];
            [self.matchingIngredient2 runAction:bounce2];
            
            
            
            touchNumber = 0;
            
            //Lógica del matching
            
            if (self.matchingIngredient1.name && self.matchingIngredient2.name) {
                
                Ingrediente *ingrediente1 = [Ingrediente ingredienteById:self.matchingIngredient1.name inContext:self.context];
                Ingrediente *ingrediente2 = [Ingrediente ingredienteById:self.matchingIngredient2.name inContext:self.context];
                
                if (ingrediente1 && ingrediente2) {
                    Matching *matching = [Matching matchingWithIngredient:ingrediente1 ingrediente:ingrediente2 inContext:self.context];
                    
                    if (matching) {
                        if (matching.good) {
                            //Make action for GOOD matching
                            NSLog(@"Good matching between %@ and %@", ingrediente1.name, ingrediente2.name);
                            
                        MatchingGood *matchingGoodScreen = [MatchingGood sceneWithSize:CGSizeMake(self.frame.size.width, self.frame.size.height)];
                            
                            matchingGoodScreen.comment = matching.comment;
                            matchingGoodScreen.scaleMode =SKSceneScaleModeAspectFill;
                        [self.view presentScene:matchingGoodScreen transition:[SKTransition doorwayWithDuration:0.3]];
                            
                            
                        } else {
                            //Make action for BAD matching
                            NSLog(@"Bad matching between %@ and %@", ingrediente1.name, ingrediente2.name);
                            MatchingBad *matchingBadScreen = [MatchingBad sceneWithSize:CGSizeMake(self.frame.size.width, self.frame.size.height)];
                            
                            matchingBadScreen.comment = matching.comment;
                            matchingBadScreen.scaleMode =SKSceneScaleModeAspectFill;
                            [self.view presentScene:matchingBadScreen transition:[SKTransition doorwayWithDuration:0.3]];
                            
                        }
                        
                    } else {
                        // MAke action for NOT matching found
                        NSLog(@"No matching between %@ and %@", ingrediente1.name, ingrediente2.name);
                        
                        Nomatching *noMatchingScreen = [Nomatching sceneWithSize:CGSizeMake(self.frame.size.width, self.frame.size.height)];
                        noMatchingScreen.comment = matching.comment;
                        noMatchingScreen.scaleMode =SKSceneScaleModeAspectFill;
                        
                        [self.view presentScene:noMatchingScreen transition:[SKTransition doorwayWithDuration:1.0]];
                        
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
        SKNode *hexagonParentNode = [self childNodeWithName:[NSString stringWithFormat:@"Node%d", i]];
        SKNode *flavourLabelNode = [self childNodeWithName:[NSString stringWithFormat:@"flavourLabel%d", i]];
        SKNode *ingredientsLabelNode = [self childNodeWithName:[NSString stringWithFormat:@"ingredientLabel%d", i]];
        SKAction *move = [SKAction moveBy:CGVectorMake(arc4random()%10, arc4random()%15) duration:3];
        SKAction *reseversedMove = [move reversedAction];
        SKAction *moveSeq = [SKAction sequence:@[ move, reseversedMove]];
        SKAction* groupAction = [SKAction group:@[moveSeq]];
        SKAction* repeatSize = [SKAction repeatActionForever:groupAction];
        repeatSize.timingMode = SKActionTimingEaseIn;
        
        [hexagonParentNode runAction:repeatSize];
        [flavourLabelNode runAction:repeatSize];
        [ingredientsLabelNode runAction:repeatSize];

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
