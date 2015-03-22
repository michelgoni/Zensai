//
//  CreateFlavourLabel.h
//  Sabores
//
//  Created by Michel Goñi on 20/3/15.
//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface CreateFlavourLabel : SKNode

@property (copy, nonatomic) NSArray *flavours;
@property (strong, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) SKLabelNode *flavourLabelName;



@end
