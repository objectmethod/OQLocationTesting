#import "OQLogManager.h"
#import "OQLog.h"
#import "OQDataManager.h"

@implementation OQLogManager

+ (void) log:(NSString*)message {
    NSManagedObjectContext *context = [[OQDataManager sharedInstance] managedObjectContext];
    OQLog *logEntry = [OQLog insertInManagedObjectContext:context];
    logEntry.created_at = [NSDate date];
    logEntry.message = message;
    [[OQDataManager sharedInstance] saveContext];
}

@end
