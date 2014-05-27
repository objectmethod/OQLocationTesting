// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OQLog.h instead.

#import <CoreData/CoreData.h>


extern const struct OQLogAttributes {
	__unsafe_unretained NSString *created_at;
	__unsafe_unretained NSString *message;
} OQLogAttributes;

extern const struct OQLogRelationships {
} OQLogRelationships;

extern const struct OQLogFetchedProperties {
} OQLogFetchedProperties;





@interface OQLogID : NSManagedObjectID {}
@end

@interface _OQLog : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (OQLogID*)objectID;





@property (nonatomic, strong) NSDate* created_at;



//- (BOOL)validateCreated_at:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* message;



//- (BOOL)validateMessage:(id*)value_ error:(NSError**)error_;






@end

@interface _OQLog (CoreDataGeneratedAccessors)

@end

@interface _OQLog (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveCreated_at;
- (void)setPrimitiveCreated_at:(NSDate*)value;




- (NSString*)primitiveMessage;
- (void)setPrimitiveMessage:(NSString*)value;




@end
