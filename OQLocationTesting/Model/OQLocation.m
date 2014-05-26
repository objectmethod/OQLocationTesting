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
    return location;
}

@end