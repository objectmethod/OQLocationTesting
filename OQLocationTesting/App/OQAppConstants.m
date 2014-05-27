#import "OQAppConstants.h"

NSString * const OQ_HOST_URL = @"http://test.1q.com";
NSString * const OQ_AUTHENTICATE_END_POINT_URL = @"/user/authenticate";
NSString * const OQ_LOCATION_END_POINT_URL = @"/user/%@/location";

NSString * const OQ_AUTH_TOKEN_KEY = @"Auth-Token";
NSString * const OQ_USER_ID_KEY = @"_id";

NSString * const OQ_SHOW_MY_CURRENT_LOCATION_SEGUE_IDENTIFIER = @"ShowMyCurrentLocation";
NSString * const OQ_SHOW_MENU_SEGUE_IDENTIFIER = @"ShowMenu";
NSString * const OQ_SHOW_ALL_LOCATIONS_SEGUE_IDENTIFIER = @"ShowAllLocations";
NSString * const OQ_SHOW_LOCATION_SEGUE_IDENTIFIER = @"ShowLocation";

NSString * const OQ_APP_TITLE = @"1Q Location Testing";
NSString * const OQ_USER_DEFAULTS_KEY_USERNAME = @"OQ_USER_DEFAULTS_KEY_USERNAME";

double const OQ_DISTANCE_TO_DEFER_LOCATION_UPDATE_IN_METERS = 1000;