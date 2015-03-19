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
#import "AppDataStack.h"
#import "Sabor.h"
#import "Ingrediente.h"
#import <CoreData/CoreData.h>


@interface GameScene()

@property (strong, nonatomic) NSManagedObjectContext *context;

@property (strong, nonatomic) SKLabelNode *matchingIngredient1;
@property (strong, nonatomic) SKLabelNode *matchingIngredient2;


@end

@implementation GameScene {
    
    int touchNumber;
}

-(void)didMoveToView:(SKView *)view {
    
    [self loadSabores];
    [self createNode1];
  [self testMatching];
    //[self moveHexagon];
    [self.view setMultipleTouchEnabled:YES];
    
    touchNumber = 0;

}


-(void) loadSabores
{
    //Fetch sabor
    NSFetchRequest *flavoursRequest = [NSFetchRequest fetchRequestWithEntityName:@"Sabor"];
    NSError *error;
   flavoursRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    self.flavours = [self.context executeFetchRequest:flavoursRequest error:&error];
    
    //fetch ingredient
    NSFetchRequest *ingredientsRequest = [NSFetchRequest fetchRequestWithEntityName:@"Ingrediente"];
  ingredientsRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    self.ingredients = [self.context executeFetchRequest:ingredientsRequest error:&error];
    
    //Fetch matching
    NSFetchRequest *matchingFetch = [NSFetchRequest fetchRequestWithEntityName:@"Matching"];
    self.matching = [self.context executeFetchRequest:matchingFetch error:nil];
    
}


//-(void)testMatching {
//    
//
//    //Fetch matching
//    NSFetchRequest *matchingFetch = [NSFetchRequest fetchRequestWithEntityName:@"Matching"];
//    self.matching = [self.context executeFetchRequest:matchingFetch error:nil];
//    
//    Ingrediente *ingredientOne = [[self.context executeFetchRequest:matchingFetch error:nil] firstObject];
//    Ingrediente *ingredientTwo =[[self.context executeFetchRequest:matchingFetch error:nil] lastObject];
//    
//    [Matching matchingWithIngredient:ingredientOne ingrediente:ingredientTwo inContext:self.context];
//    
//    NSLog(@"%@", self.context);
//}

-(void) testMatching {
    
    
    self.matchingIngredient1 = [SKLabelNode labelNodeWithFontNamed:@"Optima"];
    
    self.matchingIngredient1.text = @"";
    self.matchingIngredient1.name = @""; //name de la label seleccionada y esto viene en un método que hay
    self.matchingIngredient1.fontSize = 18;
    self.matchingIngredient1.position = CGPointMake(CGRectGetMidX(self.frame) ,
                                   CGRectGetMidY(self.frame) +90);
    
    [self addChild:self.matchingIngredient1];
    
    
    self.matchingIngredient2 = [SKLabelNode labelNodeWithFontNamed:@"Optima"];
    
    self.matchingIngredient2.text = @"";
    self.matchingIngredient2.name = @"";
    self.matchingIngredient2.fontSize = 18;
    self.matchingIngredient2.position = CGPointMake(self.matchingIngredient1.position.x, self.matchingIngredient1.position.y -140);
    
    [self addChild:self.matchingIngredient2];
    
    
}

#pragma mark -Create nodes
-(void) createNode1 {
    
    
    int i = 0;
    //Colors array to be refactored
    NSArray *colores =      @[[SKColor colorWithRed:192/255.0f green:57/255.0f blue:43/255.0f alpha:1.0f],
                              [SKColor colorWithRed: 0.5 green: 0.2 blue: 0.13 alpha: 1],
                              [SKColor colorWithRed: 0.844 green: 0.157 blue: 0.157 alpha: 1],
                              [SKColor colorWithRed: 0.844 green: 0.157 blue: 0.157 alpha: 1],
                              [SKColor colorWithRed: 0.2 green: 0.157 blue: 0.4 alpha: 1],
                              [SKColor colorWithRed: 0.844 green: 0.157 blue: 0.157 alpha: 1],
                              [SKColor colorWithRed: 0.5 green: 0.157 blue: 0.157 alpha: 1],
                              [SKColor colorWithRed: 0.844 green: 0.157 blue: 0.157 alpha: 1],
                              [SKColor colorWithRed: 0.844 green: 0.157 blue: 0.157 alpha: 1],
                              [SKColor colorWithRed: 1 green: 0.3 blue: 0.157 alpha: 1]];


   
    for (Sabor *sabor in self.flavours) {
        
        
        NSLog(@"-----------Flavour name: %@", sabor.name);
        
        
        // Crear uno a uno el hexágono
        SKNode *shapeParentNode = [self childNodeWithName:[NSString stringWithFormat:@"Node%d", i]];
        
       
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
        hexagono.strokeColor = colores[i];

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
        line1.strokeColor = colores [i];
        
        
        line2.path = bezier2Path.CGPath;
        line2.lineWidth = 1;
       line2.strokeColor = colores [i];
        
        
        line3.path = bezier3Path.CGPath;
        line3.lineWidth = 1;
       line3.strokeColor = colores [i];
        
        
        
        [shapeParentNode addChild:hexagono];
        [shapeParentNode addChild:line1];
        [shapeParentNode addChild:line2];
        [shapeParentNode addChild:line3];
        i++;
        
        //Label sabor
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Optima"];
        myLabel.alpha = 1.0;
        myLabel.text = sabor.name;
        myLabel.fontSize = 22;
        myLabel.fontColor = [SKColor colorWithRed:1 green:0.688 blue:0 alpha:1];
        myLabel.position = CGPointMake (hexagono.position.x +48 , hexagono.position.y +45);
        myLabel.zPosition = 10;
        
        
        [shapeParentNode addChild:myLabel];
        int j = 0;
        for (Ingrediente *ingrediente in sabor.ingredientes) {
            NSLog(@"--------------ingrediente name: %@", ingrediente.name);

            //Ingredientes labels
            SKLabelNode *labelIngrediente = [SKLabelNode labelNodeWithFontNamed:@"Optima"];
            labelIngrediente.alpha = 1.0;
            labelIngrediente.text = ingrediente.name;
            labelIngrediente.name = ingrediente.identifier;
            labelIngrediente.fontSize = 16;
            labelIngrediente.fontColor = [SKColor colorWithRed:1 green:0.688 blue:0 alpha:1];
            
            
           
            CGFloat y = 0;
            if (j == 1) {
                y = -27;
            }
            labelIngrediente.position = CGPointMake ((j*37) + hexagono.position.x +10 , y + hexagono.position.y +5);
            labelIngrediente.zPosition = 10;
            
            [shapeParentNode addChild:labelIngrediente];
            
            j++;
        }
    }
}


#pragma  mark -Matching


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


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (touchNumber == 0) {
        //Entramos en el primer toque
        for (UITouch* touch in touches){
            CGPoint p = [touch locationInNode:self];
            SKNode *node = [self.scene nodeAtPoint:p];
            self.matchingIngredient1.text = node.name;
            self.matchingIngredient1.name = node.name; //name de la label seleccionada y esto viene en un método que hay
        }
        touchNumber++;
        
    }else if (touchNumber == 1) {

        //Entramos en el segundo toque
        for (UITouch* touch in touches){
            CGPoint p = [touch locationInNode:self];
            SKNode *node2 = [self.scene nodeAtPoint:p];
            self.matchingIngredient2.text = node2.name;
            self.matchingIngredient2.name = node2.name;
        
        touchNumber = 0;
        }
    
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
