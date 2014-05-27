#import "OQAppDelegate.h"
#import "OQLocationManager.h"

@implementation OQAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    DLog(@"application:didFinishLaunchingWithOptions:");
    [[OQLocationManager sharedInstance] startUpdatingLocation];
    return YES;
}

@end
