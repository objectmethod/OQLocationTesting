#import "OQLocation.h"
#import "OQDataManager.h"

@interface OQLocation ()

@end


@implementation OQLocation

+ (instancetype)locationWithLatitude:(float)latitude longitude:(float)longitude {
    NSManagedObjectContext *context = [[OQDataManager sharedInstance] managedObjectContext];
    OQLocation *location = [OQLocation insertInManagedObjectContext:context];
    location.latitudeValue = latitude;
    location.longitudeValue = longitude;
    location.created_at = [NSDate date];
    return location;
}

+ (NSArray *)allLocations {
    Class class = [OQLocation class];
    return [[OQDataManager sharedInstance] getAllObjectsForEntityForClass:class];
}

+ (NSArray *)unsentLocations {
    Class class = [OQLocation class];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"sent == NO"];
    return [[OQDataManager sharedInstance] getAllObjectsForEntityForClass:class predicate:predicate];
}

+ (OQLocation*)mostRecentLocation {
    Class class = [OQLocation class];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"created_at" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    NSArray *entities = [[OQDataManager sharedInstance] getAllObjectsForEntityForClass:class predicate:nil maxNumberOfEntities:1 sortDescriptors:sortDescriptors];
    if (entities.count > 0) {
        return entities[0];
    }
    return nil;
}

- (void)markAsSent {
    self.sentValue = YES;
    [[OQDataManager sharedInstance] saveContext];
}

@end