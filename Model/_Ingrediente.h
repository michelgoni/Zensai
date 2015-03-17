// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Ingrediente.h instead.

@import CoreData;

extern const struct IngredienteAttributes {
	__unsafe_unretained NSString *identifier;
	__unsafe_unretained NSString *name;
} IngredienteAttributes;

extern const struct IngredienteRelationships {
	__unsafe_unretained NSString *matchings;
	__unsafe_unretained NSString *sabor;
} IngredienteRelationships;

@class Matching;
@class Sabor;

@interface IngredienteID : NSManagedObjectID {}
@end

@interface _Ingrediente : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) IngredienteID* objectID;

@property (nonatomic, strong) NSString* identifier;

//- (BOOL)validateIdentifier:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *matchings;

- (NSMutableSet*)matchingsSet;

@property (nonatomic, strong) Sabor *sabor;

//- (BOOL)validateSabor:(id*)value_ error:(NSError**)error_;

@end

@interface _Ingrediente (MatchingsCoreDataGeneratedAccessors)
- (void)addMatchings:(NSSet*)value_;
- (void)removeMatchings:(NSSet*)value_;
- (void)addMatchingsObject:(Matching*)value_;
- (void)removeMatchingsObject:(Matching*)value_;

@end

@interface _Ingrediente (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveIdentifier;
- (void)setPrimitiveIdentifier:(NSString*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveMatchings;
- (void)setPrimitiveMatchings:(NSMutableSet*)value;

- (Sabor*)primitiveSabor;
- (void)setPrimitiveSabor:(Sabor*)value;

@end
