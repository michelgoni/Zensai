//
//  MatchingGood.m
//  Sabores
//
//  Created by Michel Goñi on 22/3/15.
//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import "MatchingGood.h"



@implementation MatchingGood

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        
        self.backgroundColor =[SKColor colorWithRed:0/255.0 green:26/255.0 blue:55/255.0 alpha:1.0];
        
        NSString *tmp = @"This is a long string where you do not need to bother about linebreaks and my method breaks it up into multiple SKLabelNode to roughly fit a customized width. Yep it works."; // long string - just type whatever in here
        
        NSCharacterSet *separators = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSArray *words = [tmp componentsSeparatedByCharactersInSet:separators];
        
        int len = [tmp length];
        int width = 20; // specify your own width
        
        int totLines = len/width + 1;
        int cnt = 0;
        
        for (int i=0; i<totLines; i++) {
            int lenPerLine = 0;
            NSString *lineStr = @"";
            
            while (lenPerLine<width) {
                if (cnt>[words count]-1) break;
                lineStr = [NSString stringWithFormat:@"%@ %@", lineStr, words[cnt]];
                lenPerLine = [lineStr length];
                cnt ++;
                // NSLog(@"%@", lineStr);
            }
            SKLabelNode *_multiLineLabel = [SKLabelNode labelNodeWithFontNamed:@"Oxygen Light"];
            
            _multiLineLabel.text = lineStr;
            _multiLineLabel.name = [NSString stringWithFormat:@"line%d",i];
            _multiLineLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
            _multiLineLabel.fontSize = 20;
            _multiLineLabel.fontColor = [SKColor colorWithRed:1 green:1 blue:1.0 alpha:1.0];
            _multiLineLabel.position = CGPointMake(size.width/2, size.height/2+100-20*i);
            [self addChild:_multiLineLabel];
            
        }
        
        
        
    }
    return self;
}


@end
