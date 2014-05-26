@interface OQAppProperties : NSObject

+ (instancetype) sharedInstance;

- (NSURL *)applicationDocumentsDirectory;

@end
