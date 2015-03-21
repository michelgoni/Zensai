#import "Sabor.h"

@interface Sabor ()

// Private interface goes here.

@end

@implementation Sabor

// Custom logic goes here.

+ (NSArray *)allSaboresInContext:(NSManagedObjectContext *)context {
    NSFetchRequest *flavoursRequest = [NSFetchRequest fetchRequestWithEntityName:[self entityName]];
    NSError *error;
    flavoursRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    NSArray *sabores = [context executeFetchRequest:flavoursRequest error:&error];
    return sabores;
}

+ (Sabor *)saborById:(NSString *)identifier inContext:(NSManagedObjectContext *)context {
   
    NSArray *sabores = [super fetchSaborById:context id:identifier];
    
    if (sabores.count == 0) {
        return nil;
    }
    
    return (Sabor *)sabores[0];
}

@end
