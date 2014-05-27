@interface OQNetworkManager : NSObject

@property (copy, nonatomic) NSString *authenticationToken;

+ (instancetype)sharedInstance;

- (void) postParameters:(NSDictionary*)parameters toEndPoint:(NSString*)endPoint success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

@end
