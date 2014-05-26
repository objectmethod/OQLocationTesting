@interface OQLoginController : NSObject

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *authenticationToken;

+ (instancetype) sharedInstance;

- (void) login:(void (^)())success failure:(void (^)(NSError *error))failure;
- (void) loginWithUsername:(NSString*)username password:(NSString*)password success:(void (^)())success failure:(void (^)(NSError *error))failure;

@end
