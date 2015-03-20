//
//  AppDataStack.m
//  Sabores
//
//  Created by Michel Goñi on 17/3/15.
//  Copyright (c) 2015 Michel Goñi. All rights reserved.
//

#import "AppDataStack.h"
#import "Sabor.h"
#import "Ingrediente.h"
#import "Matching.h"

@interface AppDataStack ()

@property (strong, nonatomic) NSManagedObjectModel *model;
@property (strong, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) NSPersistentStoreCoordinator *storeCoordinator;

@end


@implementation AppDataStack


#pragma mark CoreData support

- (void)importDataIfNeeded {
    
    Sabor *anySabor = [Sabor saborById:@"salado" inContext:self.context];
    
    
    if (anySabor) {
        
        return;
    }
    
    
    //Extraemos array de sabores
    NSError* err = nil;
    NSString* dataPath = [[NSBundle mainBundle] pathForResource:@"flavours" ofType:@"json"];
    NSArray* sabores = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:dataPath]
                                                     options:kNilOptions
                                                       error:&err];
    
    [sabores enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
        Sabor *sabor = [Sabor insertInManagedObjectContext:self.context];
        sabor.identifier = obj[@"id_sabor"];
        sabor.name = obj[@"sabor"];
        

        NSArray *ingredients = obj[@"ingredientes"];
        
        [ingredients enumerateObjectsUsingBlock:^(NSDictionary *ingredientDict, NSUInteger idx, BOOL *stop) {
            Ingrediente *ingrediente = [Ingrediente insertInManagedObjectContext:self.context];
            ingrediente.sabor = sabor;
            ingrediente.identifier = ingredientDict[@"id_ingrediente"];
            ingrediente.name = ingredientDict[@"nombre"];
        }];
        
    }];

    //Extraemos array de matchings
    
    NSString* dataPathMatching = [[NSBundle mainBundle] pathForResource:@"matchings" ofType:@"json"];
    NSArray *matchings = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:dataPathMatching]
                                                         options:kNilOptions
                                                           error:&err];
    
    [matchings enumerateObjectsUsingBlock:^(NSDictionary *matchingDict, NSUInteger idx, BOOL *stop) {
        
        NSArray *buenos = matchingDict[@"matchingbueno"];
        [buenos enumerateObjectsUsingBlock:^(NSDictionary *matchingGoodDict, NSUInteger idx, BOOL *stop) {
        
            Matching *matching = [Matching insertInManagedObjectContext:self.context];
            matching.comment = matchingGoodDict[@"comentario"];
            matching.good = @YES;
            
            Ingrediente *ingrediente1 = [Ingrediente ingredienteById:matchingDict[@"id_ingrediente"] inContext:self.context];
            if (ingrediente1) {
                [matching addIngredientsObject:ingrediente1];
            } else {
                NSLog(@"Error: Ingrediente with id '%@' not found", matchingDict[@"id_ingrediente"]);
            }
            
            Ingrediente *ingrediente2 = [Ingrediente ingredienteById:matchingGoodDict[@"id_ingrediente"] inContext:self.context];
            if (ingrediente2) {
                [matching addIngredientsObject:ingrediente2];
            } else {
                NSLog(@"Error: Ingrediente with id '%@' not found", matchingGoodDict[@"id_ingrediente"]);
            }

        }];
        
        NSArray *malos = matchingDict[@"matchingmalo"];
        [malos enumerateObjectsUsingBlock:^(NSDictionary *matchingBadDict, NSUInteger idx, BOOL *stop) {
            
            Matching *matching = [Matching insertInManagedObjectContext:self.context];
            matching.comment = matchingBadDict[@"comentario"];
            matching.good = @NO;

            Ingrediente *ingrediente1 = [Ingrediente ingredienteById:matchingDict[@"id_ingrediente"] inContext:self.context];
            if (ingrediente1) {
                [matching addIngredientsObject:ingrediente1];
            } else {
                NSLog(@"Error: Ingrediente with id '%@' not found", matchingDict[@"id_ingrediente"]);
            }
            
            Ingrediente *ingrediente2 = [Ingrediente ingredienteById:matchingBadDict[@"id_ingrediente"] inContext:self.context];
            if (ingrediente2) {
                [matching addIngredientsObject:ingrediente2];
            } else {
                NSLog(@"Error: Ingrediente with id '%@' not found", matchingBadDict[@"id_ingrediente"]);
            }
        }];

        
        
    }];
    

    [self save];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSManagedObjectContext *)context {
    if (_context == nil) {
        NSPersistentStoreCoordinator *coordinator = self.storeCoordinator;
        if (coordinator != nil) {
            _context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
            [_context setPersistentStoreCoordinator: coordinator];
        }
    }
    
    return _context;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSManagedObjectModel *)model {
    
    if (_model != nil) {
        return _model;
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"SaboresModel" ofType:@"momd"];
    NSURL *momURL = [NSURL fileURLWithPath:path];
    _model = [[NSManagedObjectModel alloc] initWithContentsOfURL:momURL];
    
    return _model;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSPersistentStoreCoordinator *)storeCoordinator {
    NSError *error = nil;
    if (_storeCoordinator != nil) {
        return _storeCoordinator;
    }
    
    NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    
    
    NSString *storePath = [libraryPath stringByAppendingPathComponent:@"sabores.sqlite"];
    
    NSURL *storeUrl = [NSURL fileURLWithPath:storePath];
    
    NSDictionary *options = @{
                              NSMigratePersistentStoresAutomaticallyOption: @YES,
                              NSInferMappingModelAutomaticallyOption: @YES
                              };
    
    
    _storeCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.model];
    if (![_storeCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:options error:&error]) {
        NSLog(@"CoreData error: %@", error);
        abort();
    }
    
    return _storeCoordinator;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)save {
    
    [self.context performBlock:^{
        NSError *error = nil;
        if (![self.context save:&error]) {
            NSLog(@"CoreData error: %@", error);
            abort();
        }
    }];
}

@end
