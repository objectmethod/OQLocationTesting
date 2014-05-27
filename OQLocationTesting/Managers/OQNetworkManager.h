@interface OQNetworkManager : NSObject

+ (void) postParameters:(NSDictionary*)parameters toEndPoint:(NSString*)endPoint success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

@end
