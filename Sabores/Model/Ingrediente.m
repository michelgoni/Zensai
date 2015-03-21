#import "Ingrediente.h"

@interface Ingrediente ()

// Private interface goes here.

@end

@implementation Ingrediente

+ (NSArray *)allIngredientsInContext:(NSManagedObjectContext *)context {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:[self entityName]];
    NSError *error;
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    NSArray *result = [context executeFetchRequest:request error:&error];
    return result;
}


+ (Ingrediente *)ingredienteById:(NSString *)identifier inContext:(NSManagedObjectContext *)context {
    NSArray *ingredientes = [super fetchIngredienteById:context id:identifier];
    
    if (ingredientes.count == 0) {
        return nil;
    }
    
    return (Ingrediente *)ingredientes[0];
    
}

@end
