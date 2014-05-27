@interface OQBaseTableViewController : UITableViewController

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (readonly) NSFetchRequest *fetchRequest;
@property (readonly) NSString *cellReuseIdentifier;

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end
