//
//  CreateLabelIngredients.h
//  Sabores
//
//  Created by Michel Goñi on 20/3/15.
//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface LabelIngredients : SKNode

@property (copy, nonatomic) NSString *ingredienteID;

@property (strong, nonatomic) SKLabelNode *ingredientLabelName;
@property (strong, nonatomic) SKSpriteNode *ingredientLabelSprite;
@end
