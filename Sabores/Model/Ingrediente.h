#import "_Ingrediente.h"

@interface Ingrediente : _Ingrediente {}

+ (NSArray *)allIngredientsInContext:(NSManagedObjectContext *)context;

+ (Ingrediente *)ingredienteById:(NSString *)identifier inContext:(NSManagedObjectContext *)context;

@end
