#import "OQLocationManager.h"
#import "OQLocation.h"
#import "OQDataManager.h"

@interface OQLocationManager () <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation OQLocationManager

+ (instancetype)sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    self = [super init];
    
    if (self) {
        if (self.locationServicesEnabled) {
            [self initializeLocationManager];
        }
    }
    
    return self;
}

- (void) initializeLocationManager {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.pausesLocationUpdatesAutomatically = YES;
    self.locationManager.activityType = CLActivityTypeOther;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.delegate = self;
}

- (void)startUpdatingLocation {
    if (self.locationServicesEnabled) {
        [self.locationManager startUpdatingLocation];
        self.isUpdatingLocation = YES;
    }
}

#pragma mark - private

- (void) saveLocations:(NSArray*)locations {
    for (CLLocation *location in locations) {
        float latitude = location.coordinate.latitude;
        float longitude = location.coordinate.longitude;
        [OQLocation locationWithLatitude:latitude longitude:longitude];
    }
    
    [[OQDataManager sharedInstance] saveContext];
}

- (void) deferLocationUpdatesIfPossible {
    BOOL isAppActive = [[UIApplication sharedApplication] applicationState] == UIApplicationStateActive;
    
    if (self.canDeferLocationUpdates && !isAppActive) {
        DLog(@"Deferring location updates");
        [self.locationManager allowDeferredLocationUpdatesUntilTraveled:OQ_DISTANCE_TO_DEFER_LOCATION_UPDATE_IN_METERS timeout:CLTimeIntervalMax];
    }
}

#pragma mark - Helpers

- (BOOL) locationServicesEnabled {
    return [CLLocationManager locationServicesEnabled];
}

- (BOOL) canProcessLocationUpdatesInBackground {
    return [[UIApplication sharedApplication] backgroundRefreshStatus] == UIBackgroundRefreshStatusAvailable;
}

- (BOOL) canDeferLocationUpdates {
    return [CLLocationManager deferredLocationUpdatesAvailable];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    [self saveLocations:locations];
    [self deferLocationUpdatesIfPossible];
}

- (void) locationManager:(CLLocationManager *)manager didFinishDeferredUpdatesWithError:(NSError *)error {
    DLog(@"locationManager:didFinishDeferredUpdatesWithError: %@", error);
}

@end
