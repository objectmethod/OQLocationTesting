// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OQLocation.m instead.

#import "_OQLocation.h"

const struct OQLocationAttributes OQLocationAttributes = {
	.accuracy = @"accuracy",
	.created_at = @"created_at",
	.latitude = @"latitude",
	.longitude = @"longitude",
	.sent = @"sent",
};

const struct OQLocationRelationships OQLocationRelationships = {
};

const struct OQLocationFetchedProperties OQLocationFetchedProperties = {
};

@implementation OQLocationID
@end

@implementation _OQLocation

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"OQLocation" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"OQLocation";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"OQLocation" inManagedObjectContext:moc_];
}

- (OQLocationID*)objectID {
	return (OQLocationID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"accuracyValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"accuracy"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"latitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"latitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"longitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"longitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"sentValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"sent"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic accuracy;



- (double)accuracyValue {
	NSNumber *result = [self accuracy];
	return [result doubleValue];
}

- (void)setAccuracyValue:(double)value_ {
	[self setAccuracy:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveAccuracyValue {
	NSNumber *result = [self primitiveAccuracy];
	return [result doubleValue];
}

- (void)setPrimitiveAccuracyValue:(double)value_ {
	[self setPrimitiveAccuracy:[NSNumber numberWithDouble:value_]];
}





@dynamic created_at;






@dynamic latitude;



- (double)latitudeValue {
	NSNumber *result = [self latitude];
	return [result doubleValue];
}

- (void)setLatitudeValue:(double)value_ {
	[self setLatitude:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveLatitudeValue {
	NSNumber *result = [self primitiveLatitude];
	return [result doubleValue];
}

- (void)setPrimitiveLatitudeValue:(double)value_ {
	[self setPrimitiveLatitude:[NSNumber numberWithDouble:value_]];
}





@dynamic longitude;



- (double)longitudeValue {
	NSNumber *result = [self longitude];
	return [result doubleValue];
}

- (void)setLongitudeValue:(double)value_ {
	[self setLongitude:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveLongitudeValue {
	NSNumber *result = [self primitiveLongitude];
	return [result doubleValue];
}

- (void)setPrimitiveLongitudeValue:(double)value_ {
	[self setPrimitiveLongitude:[NSNumber numberWithDouble:value_]];
}





@dynamic sent;



- (BOOL)sentValue {
	NSNumber *result = [self sent];
	return [result boolValue];
}

- (void)setSentValue:(BOOL)value_ {
	[self setSent:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveSentValue {
	NSNumber *result = [self primitiveSent];
	return [result boolValue];
}

- (void)setPrimitiveSentValue:(BOOL)value_ {
	[self setPrimitiveSent:[NSNumber numberWithBool:value_]];
}










@end
