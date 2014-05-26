@interface OQLocationManager : NSObject

@property (assign, nonatomic) CLLocationAccuracy locationAccuracy;
@property (assign, nonatomic) BOOL isUpdatingLocation;

+ (instancetype) sharedInstance;

- (void) startUpdatingLocation;

@end
