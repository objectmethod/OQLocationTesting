#import "OQLocationsViewController.h"
#import "OQDataManager.h"
#import "OQLocationCell.h"
#import "OQMapViewController.h"

@interface OQLocationsViewController () <NSFetchedResultsControllerDelegate>

@end

@implementation OQLocationsViewController

- (NSFetchRequest *)fetchRequest {
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"created_at" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    Class class = [OQLocation class];
    NSString *entityName = NSStringFromClass(class);
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:entityName];
    fetchRequest.sortDescriptors = sortDescriptors;
    
    return fetchRequest;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    OQLocation *location = [self.fetchedResultsController objectAtIndexPath:indexPath];
    ((OQLocationCell*)cell).location = location;
}

- (NSString *)cellReuseIdentifier {
    return NSStringFromClass([OQLocationCell class]);
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:OQ_SHOW_LOCATION_SEGUE_IDENTIFIER]) {
        OQLocationCell *locationCell = sender;
        OQMapViewController *mapViewController = segue.destinationViewController;
        
        mapViewController.location = locationCell.location;
    }
}

@end
