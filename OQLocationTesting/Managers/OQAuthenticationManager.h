@interface OQAuthenticationManager : NSObject

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *authenticationToken;
@property (nonatomic, copy) NSString *userID;

+ (instancetype) sharedInstance;

- (void) authenticate:(void (^)())success failure:(void (^)(NSError *error))failure;
- (void) authenticateWithUsername:(NSString*)username password:(NSString*)password success:(void (^)())success failure:(void (^)(NSError *error))failure;

@end
