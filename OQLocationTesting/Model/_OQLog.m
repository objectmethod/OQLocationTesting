// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OQLog.m instead.

#import "_OQLog.h"

const struct OQLogAttributes OQLogAttributes = {
	.created_at = @"created_at",
	.message = @"message",
};

const struct OQLogRelationships OQLogRelationships = {
};

const struct OQLogFetchedProperties OQLogFetchedProperties = {
};

@implementation OQLogID
@end

@implementation _OQLog

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"OQLog" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"OQLog";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"OQLog" inManagedObjectContext:moc_];
}

- (OQLogID*)objectID {
	return (OQLogID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic created_at;






@dynamic message;











@end
