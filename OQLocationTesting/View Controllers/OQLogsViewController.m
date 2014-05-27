#import "OQLogsViewController.h"
#import "OQDataManager.h"
#import "OQLogCell.h"
#import "OQLogViewController.h"

@interface OQLogsViewController ()

@end

@implementation OQLogsViewController

- (NSFetchRequest *)fetchRequest {
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"created_at" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    Class class = [OQLog class];
    NSString *entityName = NSStringFromClass(class);
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:entityName];
    fetchRequest.sortDescriptors = sortDescriptors;
    
    return fetchRequest;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    OQLog *log = [self.fetchedResultsController objectAtIndexPath:indexPath];
    ((OQLogCell*)cell).log = log;
}

- (NSString *)cellReuseIdentifier {
    return NSStringFromClass([OQLogCell class]);
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowLogDetail"]) {
        OQLogCell *logCell = sender;
        OQLogViewController *logViewController = segue.destinationViewController;
        
        logViewController.log = logCell.log;
    }
}

@end
