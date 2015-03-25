//
//  MatchingGood.m
//  Sabores
//
//  Created by Michel Goñi on 22/3/15.
//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import "MatchingGood.h"
#import "GameScene.h"

@implementation MatchingGood




- (void)didMoveToView: (SKView *) view
{
    
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"1024x1024.jpg"];
    background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    
    [self addChild: background];
    [self volver];

    [self createText];

}



- (SKLabelNode *)volver {
    SKLabelNode *volver = [SKLabelNode labelNodeWithFontNamed:@"Futura-Medium"];
    volver.text = @"volver";
    volver.fontSize = 24;
    volver.zPosition = 2;
    volver.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
    volver.name = @"volver";
    [self addChild:volver];

    
    return volver;
    
}


-(void) createText {
    
    self.matchingLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, -300, 800, 1024)];
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
    
    if ([node.name isEqualToString:@"volver"]) {
        
        
        SKTransition *reveal = [SKTransition doorsCloseVerticalWithDuration:0.4];
        GameScene *myScene = [GameScene nodeWithFileNamed:@"GameScene"];
        myScene.scaleMode = SKSceneScaleModeAspectFill;
        [UIView animateWithDuration:1 animations:^{
            self.matchingLabel.alpha = 0.0;
            self.matchingLabel.text = @"";
            
        } completion:nil];
        
        
        [self.scene.view presentScene:myScene transition: reveal];

    }
}

@end
