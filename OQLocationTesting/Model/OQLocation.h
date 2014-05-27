#import "_OQLocation.h"

@interface OQLocation : _OQLocation {}

+ (instancetype) locationWithLatitude:(float)latitude longitude:(float)longitude;

+ (NSArray*)allLocations;
+ (NSArray*)unsentLocations;
+ (OQLocation*) mostRecentLocation;

- (void) markAsSent;

@end
