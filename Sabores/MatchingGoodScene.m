//
//  MatchingGood.m
//  Sabores
//
//  Created by Michel Goñi on 22/3/15.
//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import "MatchingGoodScene.h"
#import "GameScene.h"

@implementation MatchingGoodScene




- (void)didMoveToView: (SKView *) view
{
    
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"1024x1024.jpg"];
    background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    
    [self addChild: background];


    [self createText];
    [self drawHexagons];
    [self drawLabelsForhexagons];
    [self drawDismissButton];

}



-(void) drawHexagons {
    
    SKShapeNode *hexagon1 = [SKShapeNode node];
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(65.75, 6.5, 141, 142.75)];
    hexagon1.path = ovalPath.CGPath;
    hexagon1.lineWidth = 1.0;
    hexagon1.strokeColor = [SKColor colorWithRed:243/255.0 green:156/255.0 blue:18/255.0 alpha:1.0];
    
    hexagon1.zPosition = 10;
    hexagon1.position = CGPointMake(CGRectGetMidX(self.frame) -160 ,CGRectGetMidY(self.frame) +210);
    
    SKShapeNode *hexagon2 = [SKShapeNode node];
    UIBezierPath* ovalPath2 = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(65.75, 6.5, 141, 142.75)];
    hexagon2.path = ovalPath2.CGPath;
    hexagon2.lineWidth = 1.0;
    hexagon2.strokeColor = [SKColor colorWithRed:243/255.0 green:156/255.0 blue:18/255.0 alpha:1.0];
    
    hexagon2.zPosition = 10;
    hexagon2.position = CGPointMake(CGRectGetMidX(self.frame) -160 ,CGRectGetMidY(self.frame) +140);
    
    [self addChild: hexagon1];
    [self addChild:hexagon2];
}


-(void) drawLabelsForhexagons {
    
    
    SKLabelNode *ingredient1 = [SKLabelNode labelNodeWithFontNamed:@"SSPlight"];
    ingredient1.fontColor = [SKColor colorWithRed:243/255.0 green:156/255.0 blue:18/255.0 alpha:1.0];
    ingredient1.zPosition = 10;
    ingredient1.fontSize = 16;
    ingredient1.position = CGPointMake(CGRectGetMidX(self.frame) -30 ,CGRectGetMidY(self.frame) +250);
    ingredient1.text = @"Ingredient1";
    [self addChild: ingredient1];
    
    SKLabelNode *ingredient2 = [SKLabelNode labelNodeWithFontNamed:@"SSPlight"];
    ingredient2.fontColor = [SKColor colorWithRed:243/255.0 green:156/255.0 blue:18/255.0 alpha:1.0];
    ingredient2.zPosition = 10;
    ingredient2.fontSize = 16;
    ingredient2.position = CGPointMake(CGRectGetMidX(self.frame) -30 ,CGRectGetMidY(self.frame) +200);
    ingredient2.text = @"Ingredient2";
    [self addChild: ingredient2];
}

-(void) drawDismissButton {
    
    SKSpriteNode *dismiss = [SKSpriteNode spriteNodeWithImageNamed:@"dismiss2"];
    dismiss.xScale = 0.1;
    dismiss.yScale = 0.1;
    dismiss.zPosition = 10;
    dismiss.name = @"back";
    dismiss.position = CGPointMake(CGRectGetMidX(self.frame) -15 ,CGRectGetMidY(self.frame) -130);
    [self addChild: dismiss];
}


-(void) createText {
    
    self.matchingLabel = [[UILabel alloc] initWithFrame:CGRectMake(55, -60, 600, 1024)];
    self.matchingLabel.textColor = [UIColor colorWithRed:230 /255.0 green:126/255.0 blue:34/255.0 alpha:1.0];
    self.matchingLabel.text = self.comment;
    self.matchingLabel.alpha = 0.0;
    self.matchingLabel.numberOfLines = 0;
    
    [self.view addSubview:self.matchingLabel ];
    
    [UIView animateWithDuration:2 animations:^{
        self.matchingLabel.alpha = 1.0;
    } completion:nil];
}




- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if ([node.name isEqualToString:@"back"]) {
        
        
        SKTransition *reveal = [SKTransition doorsCloseVerticalWithDuration:0.4];
        GameScene *myScene = [GameScene nodeWithFileNamed:@"GameScene"];
        myScene.scaleMode = SKSceneScaleModeAspectFill;
        [UIView animateWithDuration:0.2 animations:^{
            self.matchingLabel.alpha = 0.0;
            self.matchingLabel.text = @"";
            
        } completion:nil];
        
        
        [self.scene.view presentScene:myScene transition: reveal];

    }
}

@end
