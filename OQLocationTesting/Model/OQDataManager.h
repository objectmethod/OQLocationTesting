@interface OQDataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (instancetype) sharedInstance;

- (void)saveContext;

- (id)insertNewObjectForEntityForClass:(Class)class;
- (NSUInteger) countOfObjectsForEntityForClass:(Class)class;
- (void) deleteAllObjectsForEntityForClass:(Class)class;

@end
