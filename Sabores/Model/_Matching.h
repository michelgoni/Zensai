// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Matching.h instead.

@import CoreData;

extern const struct MatchingAttributes {
	__unsafe_unretained NSString *comment;
	__unsafe_unretained NSString *good;
} MatchingAttributes;

extern const struct MatchingRelationships {
	__unsafe_unretained NSString *ingredients;
} MatchingRelationships;

@class Ingrediente;

@interface MatchingID : NSManagedObjectID {}
@end

@interface _Matching : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) MatchingID* objectID;

@property (nonatomic, strong) NSString* comment;

//- (BOOL)validateComment:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* good;

@property (atomic) BOOL goodValue;
- (BOOL)goodValue;
- (void)setGoodValue:(BOOL)value_;

//- (BOOL)validateGood:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *ingredients;

- (NSMutableSet*)ingredientsSet;

@end

@interface _Matching (IngredientsCoreDataGeneratedAccessors)
- (void)addIngredients:(NSSet*)value_;
- (void)removeIngredients:(NSSet*)value_;
- (void)addIngredientsObject:(Ingrediente*)value_;
- (void)removeIngredientsObject:(Ingrediente*)value_;

@end

@interface _Matching (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveComment;
- (void)setPrimitiveComment:(NSString*)value;

- (NSNumber*)primitiveGood;
- (void)setPrimitiveGood:(NSNumber*)value;

- (BOOL)primitiveGoodValue;
- (void)setPrimitiveGoodValue:(BOOL)value_;

- (NSMutableSet*)primitiveIngredients;
- (void)setPrimitiveIngredients:(NSMutableSet*)value;

@end
