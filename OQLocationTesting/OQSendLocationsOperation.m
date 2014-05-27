#import "OQSendLocationsOperation.h"
#import "OQLocation.h"
#import "OQNetworkManager.h"

@implementation OQSendLocationsOperation

- (void)main {
    @autoreleasepool {
        [self sendMostRecentLocationIfNecessary];
    }
}

- (void) sendMostRecentLocationIfNecessary {
    OQLocation *location = [OQLocation mostRecentLocation];
    
    // only send the most-recent location if it has not already been sent
    if (location.sentValue == NO) {
        NSDictionary *parameters = @{
                                     @"latitude" : location.latitude,
                                     @"longitude" : location.longitude
                                     };
        
        [OQNetworkManager postParameters:parameters toEndPoint:OQ_LOCATION_END_POINT_URL success:^(id responseObject) {
            DLog(@"sent location: %@", responseObject);
            [location markAsSent];
        } failure:^(NSError *error) {
            DLog("Error sending location: %@", error);
        }];
    }
}

@end
