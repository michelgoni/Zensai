#import "_Sabor.h"

@interface Sabor : _Sabor {}
// Custom logic goes here.

+ (NSArray *)allSaboresInContext:(NSManagedObjectContext *)context;

+ (Sabor *)saborById:(NSString *)identifier inContext:(NSManagedObjectContext *)context;



@end
