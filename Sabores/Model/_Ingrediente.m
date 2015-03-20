// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Ingrediente.m instead.

#import "_Ingrediente.h"

const struct IngredienteAttributes IngredienteAttributes = {
	.identifier = @"identifier",
	.name = @"name",
};

const struct IngredienteRelationships IngredienteRelationships = {
	.matchings = @"matchings",
	.sabor = @"sabor",
};

@implementation IngredienteID
@end

@implementation _Ingrediente

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Ingrediente" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Ingrediente";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Ingrediente" inManagedObjectContext:moc_];
}

- (IngredienteID*)objectID {
	return (IngredienteID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic identifier;

@dynamic name;

@dynamic matchings;

- (NSMutableSet*)matchingsSet {
	[self willAccessValueForKey:@"matchings"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"matchings"];

	[self didAccessValueForKey:@"matchings"];
	return result;
}

@dynamic sabor;

+ (NSArray*)fetchIngredienteById:(NSManagedObjectContext*)moc_ id:(NSString*)id_ {
	NSError *error = nil;
	NSArray *result = [self fetchIngredienteById:moc_ id:id_ error:&error];
	if (error) {
#ifdef NSAppKitVersionNumber10_0
		[NSApp presentError:error];
#else
		NSLog(@"error: %@", error);
#endif
	}
	return result;
}
+ (NSArray*)fetchIngredienteById:(NSManagedObjectContext*)moc_ id:(NSString*)id_ error:(NSError**)error_ {
	NSParameterAssert(moc_);
	NSError *error = nil;

	NSManagedObjectModel *model = [[moc_ persistentStoreCoordinator] managedObjectModel];

	NSDictionary *substitutionVariables = [NSDictionary dictionaryWithObjectsAndKeys:

														id_, @"id",

														nil];

	NSFetchRequest *fetchRequest = [model fetchRequestFromTemplateWithName:@"ingredienteById"
													 substitutionVariables:substitutionVariables];
	NSAssert(fetchRequest, @"Can't find fetch request named \"ingredienteById\".");

	NSArray *result = [moc_ executeFetchRequest:fetchRequest error:&error];
	if (error_) *error_ = error;
	return result;
}

@end

