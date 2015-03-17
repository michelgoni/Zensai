#import "_Matching.h"

@interface Matching : _Matching {}

+ (Matching *)matchingWithIngredient:(Ingrediente *)ingrediente1 ingrediente:(Ingrediente *)ingrediente2 inContext:(NSManagedObjectContext *)context;

@end
