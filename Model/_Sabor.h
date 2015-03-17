// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Sabor.h instead.

@import CoreData;

extern const struct SaborAttributes {
	__unsafe_unretained NSString *identifier;
	__unsafe_unretained NSString *name;
} SaborAttributes;

extern const struct SaborRelationships {
	__unsafe_unretained NSString *ingredientes;
} SaborRelationships;

@class Ingrediente;

@interface SaborID : NSManagedObjectID {}
@end

@interface _Sabor : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) SaborID* objectID;

@property (nonatomic, strong) NSString* identifier;

//- (BOOL)validateIdentifier:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *ingredientes;

- (NSMutableSet*)ingredientesSet;

+ (NSArray*)fetchSaborById:(NSManagedObjectContext*)moc_ id:(NSString*)id_ ;
+ (NSArray*)fetchSaborById:(NSManagedObjectContext*)moc_ id:(NSString*)id_ error:(NSError**)error_;

@end

@interface _Sabor (IngredientesCoreDataGeneratedAccessors)
- (void)addIngredientes:(NSSet*)value_;
- (void)removeIngredientes:(NSSet*)value_;
- (void)addIngredientesObject:(Ingrediente*)value_;
- (void)removeIngredientesObject:(Ingrediente*)value_;

@end

@interface _Sabor (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveIdentifier;
- (void)setPrimitiveIdentifier:(NSString*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveIngredientes;
- (void)setPrimitiveIngredientes:(NSMutableSet*)value;

@end
