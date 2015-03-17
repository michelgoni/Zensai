#import "Ingrediente.h"

@interface Ingrediente ()

// Private interface goes here.

@end

@implementation Ingrediente

+ (Ingrediente *)ingredienteById:(NSString *)identifier inContext:(NSManagedObjectContext *)context {
    
    
    NSArray *ingredientes = [super fetchIngredienteById:context];
    
    if (ingredientes.count == 0) {
        return nil;
    }
    
    return (Ingrediente *)ingredientes[0];
    
}

@end
