#import "OQLoginController.h"
#import "AFNetworking.h"
#import "SSKeychain.h"

@implementation OQLoginController

+ (instancetype)sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)login:(void (^)())success failure:(void (^)(NSError *))failure {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters = @{
                                 @"username" : self.username,
                                 @"password" : self.password
                                 };
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:OQ_AUTHENTICATE_URL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *authenticationToken = [responseObject objectForKey:OQ_AUTH_TOKEN_KEY];
        self.authenticationToken = authenticationToken;
        
        [[NSUserDefaults standardUserDefaults] setValue:self.username forKey:OQ_USER_DEFAULTS_KEY_USERNAME];
        [SSKeychain setPassword:self.authenticationToken forService:OQ_APP_TITLE account:self.username];
        
        success();
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

- (void)loginWithUsername:(NSString *)username password:(NSString *)password success:(void (^)())success failure:(void (^)(NSError *))failure {
    self.username = username;
    self.password = password;
    [self login:success failure:failure];
}

@end
