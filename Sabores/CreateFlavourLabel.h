//
//  CreateFlavourLabel.h
//  Sabores
//
//  Created by Michel Goñi on 20/3/15.
//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

@protocol GestureeLsFlavour <UIGestureRecognizerDelegate>



@end

@interface CreateFlavourLabel : SKNode

@property (copy, nonatomic) NSString *saborID;

@property (copy, nonatomic) NSArray *flavours;
@property (strong, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) SKLabelNode *flavourLabelName;

-(instancetype)initWithColor: (int) color;

@end
