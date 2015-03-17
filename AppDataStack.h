//
//  AppDataStack.h
//  Sabores
//
//  Created by Michel Goñi on 17/3/15.
//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface AppDataStack : NSObject

@property (readonly, nonatomic) NSManagedObjectModel *model;
@property (readonly, nonatomic) NSManagedObjectContext *context;
@property (readonly, nonatomic) NSPersistentStoreCoordinator *storeCoordinator;


- (void)importDataIfNeeded;

@end
