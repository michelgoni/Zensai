#import "_Ingrediente.h"

@interface Ingrediente : _Ingrediente {}

+ (Ingrediente *)ingredienteById:(NSString *)identifier inContext:(NSManagedObjectContext *)context;

@end
