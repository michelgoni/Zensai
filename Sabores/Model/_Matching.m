// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Matching.m instead.

#import "_Matching.h"

const struct MatchingAttributes MatchingAttributes = {
	.comment = @"comment",
	.good = @"good",
};

const struct MatchingRelationships MatchingRelationships = {
	.ingredients = @"ingredients",
};

@implementation MatchingID
@end

@implementation _Matching

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Matching" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Matching";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Matching" inManagedObjectContext:moc_];
}

- (MatchingID*)objectID {
	return (MatchingID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"goodValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"good"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic comment;

@dynamic good;

- (BOOL)goodValue {
	NSNumber *result = [self good];
	return [result boolValue];
}

- (void)setGoodValue:(BOOL)value_ {
	[self setGood:@(value_)];
}

- (BOOL)primitiveGoodValue {
	NSNumber *result = [self primitiveGood];
	return [result boolValue];
}

- (void)setPrimitiveGoodValue:(BOOL)value_ {
	[self setPrimitiveGood:@(value_)];
}

@dynamic ingredients;

- (NSMutableSet*)ingredientsSet {
	[self willAccessValueForKey:@"ingredients"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"ingredients"];

	[self didAccessValueForKey:@"ingredients"];
	return result;
}

@end

