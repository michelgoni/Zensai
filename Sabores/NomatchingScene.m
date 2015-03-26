//
//  Nomatching.m
//  Sabores
//
//  Created by Michel Goñi on 23/3/15.
//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import "NomatchingScene.h"
#import "GameScene.h"
#import "SKEase.h"

@interface NomatchingScene  ()


@property (strong, nonatomic) SKLabelNode *volver;
@property (strong, nonatomic) SKNode *node;
@property (strong, nonatomic) SKSpriteNode *dismiss;

@end

@implementation NomatchingScene

- (void)didMoveToView: (SKView *) view
{
    
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"matchingscreenbackblur"];
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
    hexagon1.strokeColor = [SKColor whiteColor];
    hexagon1.zPosition = 10;
    hexagon1.position = CGPointMake(CGRectGetMidX(self.frame) -160 ,CGRectGetMidY(self.frame) +210);
    
    SKShapeNode *hexagon2 = [SKShapeNode node];
    UIBezierPath* ovalPath2 = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(65.75, 6.5, 141, 142.75)];
    hexagon2.path = ovalPath2.CGPath;
    hexagon2.lineWidth = 1.0;
    hexagon2.strokeColor = [SKColor whiteColor];
    
    hexagon2.zPosition = 10;
    hexagon2.position = CGPointMake(CGRectGetMidX(self.frame) -160 ,CGRectGetMidY(self.frame) +140);
    
    [self addChild: hexagon1];
    [self addChild:hexagon2];
}


-(void) drawLabelsForhexagons {
    
    
    SKLabelNode *ingredient1 = [SKLabelNode labelNodeWithFontNamed:@"SSPlight"];
    ingredient1.fontColor = [SKColor whiteColor];
    ingredient1.zPosition = 10;
    ingredient1.fontSize = 16;
    ingredient1.position = CGPointMake(CGRectGetMidX(self.frame) -30 ,CGRectGetMidY(self.frame) +250);
    ingredient1.text = self.ingredient1Name;
    [self addChild: ingredient1];
    
    SKLabelNode *ingredient2 = [SKLabelNode labelNodeWithFontNamed:@"SSPlight"];
    ingredient2.fontColor = [SKColor whiteColor];
    ingredient2.zPosition = 10;
    ingredient2.fontSize = 16;
    ingredient2.position = CGPointMake(CGRectGetMidX(self.frame) -30 ,CGRectGetMidY(self.frame) +200);
    ingredient2.text = self.ingredient2Name;
    [self addChild: ingredient2];
}

-(void) drawDismissButton {
    
    self.dismiss = [SKSpriteNode spriteNodeWithImageNamed:@"dismiss3"];
    SKSpriteNode *mail = [SKSpriteNode spriteNodeWithImageNamed:@"Untitled"];
    
    self.dismiss.xScale = 0.1;
    self.dismiss.yScale = 0.1;
    self.dismiss.zPosition = 10;
    self.dismiss.name = @"back";
    self.dismiss.position = CGPointMake(CGRectGetMidX(self.frame) -15 ,CGRectGetMidY(self.frame) -285);
    mail.position = CGPointMake(self.dismiss.position.x +70, self.dismiss.position.y +70);
    
    [self addChild: self.dismiss];
    [self addChild:mail];
    
}



-(void) createText {
    
    self.matchingLabel = [[UILabel alloc] initWithFrame:CGRectMake(55, 40, 660, 1024)];
    self.matchingLabel.textColor = [UIColor colorWithRed:230 /255.0 green:126/255.0 blue:34/255.0 alpha:1.0];
    self.matchingLabel.text = [NSString stringWithFormat:@"Pero de verdad pensabas que %@ y %@ pegaban? ¿Estabas del todo seguro? Bueno, si aún estás del todo seguro, puedes contactar cobn nosotros y contarnos cómo estos dos ingredientes se combinan.", self.ingredient1Name, self.ingredient2Name];
    self.matchingLabel.alpha = 0.0;
    self.matchingLabel.font = [UIFont fontWithName:@"Optima" size:20];
    self.matchingLabel.numberOfLines = 0;
    
    [self.view addSubview:self.matchingLabel ];
    
    [UIView animateWithDuration:2 animations:^{
        self.matchingLabel.alpha = 1.0;
    } completion:nil];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    self.node = [self nodeAtPoint:location];
    
    
    
    if ([self.node.name isEqualToString:@"back"]) {
        
        SKAction *rotateDismissButton = [SKEase RotateFromWithNode:self.node EaseFunction:CurveTypeExpo Mode:CircularEaseIn(15) Time:0.5 FromValue:360];
        [self.dismiss runAction:rotateDismissButton completion:^{
            SKTransition *reveal = [SKTransition doorsCloseVerticalWithDuration:0.2];
            GameScene *myScene = [GameScene nodeWithFileNamed:@"GameScene"];
            myScene.scaleMode = SKSceneScaleModeAspectFill;
            self.matchingLabel.alpha = 0.0;
            self.matchingLabel.text = @"";
            [self.scene.view presentScene:myScene transition: reveal];
        } ];
    }
    
}



@end
