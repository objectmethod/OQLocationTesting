#import "OQNetworkManager.h"
#import "AFNetworking.h"

@implementation OQNetworkManager

+ (instancetype)sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void) postParameters:(NSDictionary*)parameters toEndPoint:(NSString*)endPoint success:(void (^)(id responseObject))success failure:(void (^)(NSError *))failure {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    
    if (self.authenticationToken) {
        DLog(@"setting %@ header to %@", OQ_AUTH_TOKEN_KEY, self.authenticationToken);
        [manager.requestSerializer setValue:self.authenticationToken forHTTPHeaderField:OQ_AUTH_TOKEN_KEY];
        DLog(@"headers: %@", manager.requestSerializer.HTTPRequestHeaders);
    }
    
    manager.requestSerializer = requestSerializer;
    
    AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];
    [responseSerializer setReadingOptions:NSJSONReadingAllowFragments];
    
    manager.responseSerializer = responseSerializer;
    
    NSString *url = [NSString stringWithFormat:@"%@%@", OQ_HOST_URL, endPoint];
    
    DLog(@"posting parameters: %@ to url: %@", parameters, url);
    
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

@end
