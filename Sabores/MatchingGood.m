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
    
    self.matchingLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 400, 400)];
    
    self.matchingLabel .textColor = [UIColor whiteColor];
    self.matchingLabel .text = @"";
    self.matchingLabel.numberOfLines = 0;
    
    [self.view addSubview:self.matchingLabel ];
}


//-(void) createText {
//    
//    // For the sake of testing, I just use a dummy NSString and hardcode the string I want to display.
//    // This string can be anything - even a string of paragraph that you retrieve from the web or pdf or whatever.
//    
//    NSString *tmp = @""; // long string - just type whatever in here
//    
//    // parse through the string and put each words into an array.
//    NSCharacterSet *separators = [NSCharacterSet whitespaceAndNewlineCharacterSet];
//    NSArray *words = [tmp componentsSeparatedByCharactersInSet:separators];
//    
//    int len = [tmp length];
//    int width = 100; // specify your own width to fit the device screen
//    
//    // get the number of labelnode we need.
//    int totLines = len/width + 1;
//    int cnt = 0; // used to parse through the words array
//    
//    // here is the for loop that create all the SKLabelNode that we need to
//    // display the string.
//    
//    for (int i=0; i<totLines; i++) {
//        int lenPerLine = 0;
//        NSString *lineStr = @"";
//        
//        while (lenPerLine<width) {
//            if (cnt>[words count]-1) break; // failsafe - avoid overflow error
//            lineStr = [NSString stringWithFormat:@"%@ %@", lineStr, words[cnt]];
//            lenPerLine = [lineStr length];
//            cnt ++;
//            // NSLog(@"%@", lineStr);
//        }
//        // creation of the SKLabelNode itself
//        self._multiLineLabel = [SKLabelNode labelNodeWithFontNamed:@"Oxygen Light"];
//        self._multiLineLabel.text = lineStr;
//        // name each label node so you can animate it if u wish
//        // the rest of the code should be self-explanatory
//        self._multiLineLabel.name = [NSString stringWithFormat:@"line%d",i];
//        self._multiLineLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
//        self._multiLineLabel.fontSize = 20;
//        self._multiLineLabel.zPosition = 10;
//        self._multiLineLabel.fontColor = [SKColor colorWithRed:1 green:1 blue:1.0 alpha:1.0];
//        self._multiLineLabel.position = CGPointMake(self.size.width/2, self.size.height/2+100-20*i);
//        
//        [self addChild:self._multiLineLabel];
//    }
//}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if ([node.name isEqualToString:@"volver"]) {
        
        
        SKTransition *reveal = [SKTransition doorsCloseVerticalWithDuration:2];
        GameScene *myScene = [GameScene nodeWithFileNamed:@"GameScene"];
        myScene.scaleMode = SKSceneScaleModeAspectFill;
        [self.scene.view presentScene:myScene transition: reveal];

    }
}

@end
