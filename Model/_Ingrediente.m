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

@end

