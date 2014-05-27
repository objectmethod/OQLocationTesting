#import "OQNetworkManager.h"
#import "AFNetworking.h"

@implementation OQNetworkManager

+ (void) postParameters:(NSDictionary*)parameters toEndPoint:(NSString*)endPoint success:(void (^)(id responseObject))success failure:(void (^)(NSError *))failure {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:endPoint parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

@end
