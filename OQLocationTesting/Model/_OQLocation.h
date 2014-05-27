// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OQLocation.h instead.

#import <CoreData/CoreData.h>


extern const struct OQLocationAttributes {
	__unsafe_unretained NSString *accuracy;
	__unsafe_unretained NSString *created_at;
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *longitude;
	__unsafe_unretained NSString *sent;
} OQLocationAttributes;

extern const struct OQLocationRelationships {
} OQLocationRelationships;

extern const struct OQLocationFetchedProperties {
} OQLocationFetchedProperties;








@interface OQLocationID : NSManagedObjectID {}
@end

@interface _OQLocation : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (OQLocationID*)objectID;





@property (nonatomic, strong) NSNumber* accuracy;



@property double accuracyValue;
- (double)accuracyValue;
- (void)setAccuracyValue:(double)value_;

//- (BOOL)validateAccuracy:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* created_at;



//- (BOOL)validateCreated_at:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* latitude;



@property double latitudeValue;
- (double)latitudeValue;
- (void)setLatitudeValue:(double)value_;

//- (BOOL)validateLatitude:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* longitude;



@property double longitudeValue;
- (double)longitudeValue;
- (void)setLongitudeValue:(double)value_;

//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* sent;



@property BOOL sentValue;
- (BOOL)sentValue;
- (void)setSentValue:(BOOL)value_;

//- (BOOL)validateSent:(id*)value_ error:(NSError**)error_;






@end

@interface _OQLocation (CoreDataGeneratedAccessors)

@end

@interface _OQLocation (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveAccuracy;
- (void)setPrimitiveAccuracy:(NSNumber*)value;

- (double)primitiveAccuracyValue;
- (void)setPrimitiveAccuracyValue:(double)value_;




- (NSDate*)primitiveCreated_at;
- (void)setPrimitiveCreated_at:(NSDate*)value;




- (NSNumber*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSNumber*)value;

- (double)primitiveLatitudeValue;
- (void)setPrimitiveLatitudeValue:(double)value_;




- (NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber*)value;

- (double)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(double)value_;




- (NSNumber*)primitiveSent;
- (void)setPrimitiveSent:(NSNumber*)value;

- (BOOL)primitiveSentValue;
- (void)setPrimitiveSentValue:(BOOL)value_;




@end
