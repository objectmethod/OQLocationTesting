#import "OQAuthenticationManager.h"
#import "SSKeychain.h"
#import "OQNetworkManager.h"

@implementation OQAuthenticationManager

+ (instancetype)sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)authenticate:(void (^)())success failure:(void (^)(NSError *))failure {
    NSDictionary *parameters = @{
                                 @"username" : self.username,
                                 @"password" : self.password
                                 };
    
    [[OQNetworkManager sharedInstance] postParameters:parameters toEndPoint:OQ_AUTHENTICATE_END_POINT_URL success:^(id responseObject) {
        [self handleResponse:responseObject];
        success();
    } failure:^(NSError *error) {
        failure(error);
    }];
}

- (void) handleResponse:(id) responseObject {
    self.authenticationToken = [responseObject objectForKey:OQ_AUTH_TOKEN_KEY];
    self.userID = [responseObject objectForKey:OQ_USER_ID_KEY];
    
    [self storeAuthenticationToken:self.authenticationToken inKeychainForAccount:self.userID];
    [self setNetworkManagerAuthenticationToken:self.authenticationToken];
}

- (void) storeAuthenticationToken:(NSString*)authenticationToken inKeychainForAccount:(NSString*)account {
    [[NSUserDefaults standardUserDefaults] setValue:self.userID forKey:OQ_USER_DEFAULTS_KEY_USERNAME];
    [SSKeychain setPassword:self.authenticationToken forService:OQ_APP_TITLE account:self.userID];
}

- (void) setNetworkManagerAuthenticationToken:(NSString*)authenticationToken {
    [OQNetworkManager sharedInstance].authenticationToken = authenticationToken;
}

- (void)authenticateWithUsername:(NSString *)username password:(NSString *)password success:(void (^)())success failure:(void (^)(NSError *))failure {
    self.username = username;
    self.password = password;
    [self authenticate:success failure:failure];
}

- (void)logout {
    [SSKeychain deletePasswordForService:OQ_APP_TITLE account:self.userID];
    [OQNetworkManager sharedInstance].authenticationToken = nil;
}

@end