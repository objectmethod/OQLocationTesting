#import "OQSendLocationOperation.h"
#import "OQLocation.h"
#import "OQNetworkManager.h"
#import "OQAuthenticationManager.h"

@implementation OQSendLocationOperation

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
        
        NSString *userID = [[OQAuthenticationManager sharedInstance] userID];
        NSString *endPoint = [NSString stringWithFormat:OQ_LOCATION_END_POINT_URL, userID];
        
        [[OQNetworkManager sharedInstance] postParameters:parameters toEndPoint:endPoint success:^(id responseObject) {
            DLog(@"sent location: %@", responseObject);
            [location markAsSent];
        } failure:^(NSError *error) {
            DLog("Error sending location: %@", error);
        }];
    }
}

@end