#import "_Sabor.h"

@interface Sabor : _Sabor {}
// Custom logic goes here.

+ (Sabor *)saborById:(NSString *)identifier inContext:(NSManagedObjectContext *)context;

@end
