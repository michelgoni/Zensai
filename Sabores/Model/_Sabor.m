// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Sabor.m instead.

#import "_Sabor.h"

const struct SaborAttributes SaborAttributes = {
	.identifier = @"identifier",
	.name = @"name",
};

const struct SaborRelationships SaborRelationships = {
	.ingredientes = @"ingredientes",
};

@implementation SaborID
@end

@implementation _Sabor

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Sabor" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Sabor";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Sabor" inManagedObjectContext:moc_];
}

- (SaborID*)objectID {
	return (SaborID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic identifier;

@dynamic name;

@dynamic ingredientes;

- (NSMutableSet*)ingredientesSet {
	[self willAccessValueForKey:@"ingredientes"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"ingredientes"];

	[self didAccessValueForKey:@"ingredientes"];
	return result;
}

+ (NSArray*)fetchSaborById:(NSManagedObjectContext*)moc_ id:(NSString*)id_ {
	NSError *error = nil;
	NSArray *result = [self fetchSaborById:moc_ id:id_ error:&error];
	if (error) {
#ifdef NSAppKitVersionNumber10_0
		[NSApp presentError:error];
#else
		NSLog(@"error: %@", error);
#endif
	}
	return result;
}
+ (NSArray*)fetchSaborById:(NSManagedObjectContext*)moc_ id:(NSString*)id_ error:(NSError**)error_ {
	NSParameterAssert(moc_);
	NSError *error = nil;

	NSManagedObjectModel *model = [[moc_ persistentStoreCoordinator] managedObjectModel];

	NSDictionary *substitutionVariables = [NSDictionary dictionaryWithObjectsAndKeys:

														id_, @"id",

														nil];

	NSFetchRequest *fetchRequest = [model fetchRequestFromTemplateWithName:@"saborById"
													 substitutionVariables:substitutionVariables];
	NSAssert(fetchRequest, @"Can't find fetch request named \"saborById\".");

	NSArray *result = [moc_ executeFetchRequest:fetchRequest error:&error];
	if (error_) *error_ = error;
	return result;
}

@end

