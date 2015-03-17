#import "Sabor.h"

@interface Sabor ()

// Private interface goes here.

@end

@implementation Sabor

// Custom logic goes here.
+ (Sabor *)saborById:(NSString *)identifier inContext:(NSManagedObjectContext *)context {
    NSArray *sabores = [super fetchSaborById:context id:identifier];
    
    if (sabores.count == 0) {
        return nil;
    }
    
    return (Sabor *)sabores[0];
}

@end
