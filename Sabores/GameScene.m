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
#import "Hexagon.h"
#import "FlavourLabel.h"
#import "LabelIngredients.h"
#import "MatchingGood.h"
#import "MatchingBad.h"
#import "Nomatching.h"

@interface GameScene()

@property (strong, nonatomic) NSManagedObjectContext *context;

@property (strong, nonatomic) SKNode *node;
@property (strong, nonatomic) SKNode *flavourLabelNode;
@property (strong, nonatomic) SKNode *ingredientLabelNode;

@property (strong, nonatomic) SKLabelNode *matchingIngredient1;
@property (strong, nonatomic) SKLabelNode *matchingIngredient2;

@property (strong, nonatomic) Hexagon *touches;
@property (strong, nonatomic) FlavourLabel *labelFlavour;
@property (strong, nonatomic) LabelIngredients *labelIngredients;

@property (strong, nonatomic) Ingrediente *selectedIngredient1;
@property (strong, nonatomic) Ingrediente *selectedIngredient2;
@property (strong, nonatomic) Sabor *selectedFlavour;


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
        
        //Hexagonos ////TBR/////
        NSLog(@"-----------Flavour name: %@", sabor.name);
        _touches = [Hexagon node];
        _touches = [_touches initWithColor: i];
        _touches.saborID = sabor.identifier;
        
        _touches.name = sabor.name;
        self.node = (SKNode *)[self childNodeWithName:[NSString stringWithFormat:@"Node%d", i]];
        [self.node addChild:_touches];
        self.node.userData = [@{@"saborID":sabor.name} mutableCopy];

        //Sabores ////TBR////
        _labelFlavour = [FlavourLabel node];
        _labelFlavour = [_labelFlavour initWithColor:i];
        _labelFlavour.saborID = sabor.identifier;
        _labelFlavour.flavourLabelName.text = sabor.name;
        _labelFlavour.flavourLabelName.name = sabor.name;
        self.flavourLabelNode = (SKNode *)[self childNodeWithName:[NSString stringWithFormat:@"flavourLabel%d", i]];
        
        [self.flavourLabelNode addChild:_labelFlavour];
        self.flavourLabelNode.userData = [@{@"saborID":sabor.name} mutableCopy];

        i++;
        
         }
}


-(void) createIngredientsLabel {
    

    int j = 0;
    for (Sabor *sabor in self.flavours ) {
        
        
        for (Ingrediente *ingrediente in sabor.ingredientes) {
    
           NSLog(@"--------------ingrediente name: %@", ingrediente.name);
          
          _labelIngredients = [LabelIngredients node];
            _labelIngredients.ingredienteID = ingrediente.identifier;
            self.ingredientLabelNode = (SKNode *)[self childNodeWithName:[NSString stringWithFormat:@"ingredientLabel%d", j]];
            self.labelIngredients.ingredientLabelName.text = ingrediente.name;
            self.labelIngredients.ingredientLabelName.name = ingrediente.identifier;
            [self.ingredientLabelNode addChild:_labelIngredients];
            self.ingredientLabelNode.alpha = 0.0;
            self.ingredientLabelNode.userData = [@{@"saborID":ingrediente.sabor.identifier, @"ingredienteID":ingrediente.identifier} mutableCopy];

           j++;
            
            
        }
    }
}
        


-(void) loadSabores
{
    self.flavours = [Sabor allSaboresInContext:self.context];
    
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

- (Hexagon *)flavourNode:(SKNode *)node {
    if (!node) return nil;
    
    if ([node isKindOfClass:[Hexagon class]]) {
        return (Hexagon *)node;
    }
    
    return [self flavourNode:node.parent];
}

- (LabelIngredients *)ingredientNode:(SKNode *)node {
    if (!node) return nil;
    
    if ([node isKindOfClass:[LabelIngredients class]]) {
        return (LabelIngredients *)node;
    }
    
    return [self ingredientNode:node.parent];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    

        for (UITouch* touch in touches){
            
            CGPoint p = [touch locationInNode:self];
            SKNode *nodeK = [self.scene nodeAtPoint:p];
            
            LabelIngredients *ingredientNode = [self ingredientNode:nodeK];
            if (ingredientNode) {
                NSLog(@"Ingrediente %@", nodeK);
                if (self.selectedIngredient1) {
                    if (self.selectedIngredient2) {
                        // Two ingredients already selected
  
                        
                    } else {
                        // Test if the same ingredient shake some animations!
                        
                        // If not the same
                        self.selectedIngredient2 = [Ingrediente ingredienteById:ingredientNode.ingredienteID inContext:self.context];
                        self.matchingIngredient2.text = self.selectedIngredient2.name;
                        self.matchingIngredient2.name = self.selectedIngredient2.identifier;
                        
                        // Two ingredients just selected
                        
                        // Search matching
                        
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
                } else {
                    //First ingredient
                    self.selectedIngredient1 = [Ingrediente ingredienteById:ingredientNode.ingredienteID inContext:self.context];
                    self.matchingIngredient1.text = self.selectedIngredient1.name;
                    self.matchingIngredient1.name = self.selectedIngredient1.identifier;
                }

            } else {
                // Touched on other node not an ingredient label
                Hexagon *flavourNode = [self flavourNode:nodeK];
                if (flavourNode) {
                    //Which kind of flavour
                    self.selectedFlavour = [Sabor saborById:flavourNode.saborID inContext:self.context];
                    if ([self.selectedFlavour.identifier isEqualToString:@"salado"]) {
                    
                        for (int i = 0; i< 3; i++) {
                            
                            SKNode *ingredientNode1 = [self childNodeWithName:[NSString stringWithFormat:@"ingredientLabel%d", i]];
                            SKAction *fade = [SKAction fadeAlphaTo:1 duration:0.2];
                            
                            [ingredientNode1 runAction:fade];
                        }
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
