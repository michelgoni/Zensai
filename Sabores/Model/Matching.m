#import "Matching.h"

@interface Matching ()

// Private interface goes here.

@end

@implementation Matching

// Custom logic goes here.
//
+(Matching *)matchingWithIngredient:(Ingrediente *)ingrediente1 ingrediente:(Ingrediente *)ingrediente2 inContext:(NSManagedObjectContext *)context {
    
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[Matching entityName]];
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%@ in ingredients AND %@ in ingredients", ingrediente1, ingrediente2];
    [fetchRequest setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"%@", error);
    }
    
    return [fetchedObjects firstObject];
}


@end
