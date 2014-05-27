@interface OQDataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (instancetype) sharedInstance;

- (void)saveContext;

- (id)insertNewObjectForEntityForClass:(Class)class;
- (NSUInteger) countOfObjectsForEntityForClass:(Class)class;
- (void) deleteAllObjectsForEntityForClass:(Class)class;
- (NSArray*) getAllObjectsForEntityForClass:(Class)class;
- (NSArray*) getAllObjectsForEntityForClass:(Class)class predicate:(NSPredicate*)predicate;
- (NSArray*) getAllObjectsForEntityForClass:(Class)class predicate:(NSPredicate *)predicate maxNumberOfEntities:(NSUInteger)maxNumberOfEntities;
- (NSArray*) getAllObjectsForEntityForClass:(Class)class predicate:(NSPredicate *)predicate maxNumberOfEntities:(NSUInteger)maxNumberOfEntities sortDescriptors:(NSArray*)sortDescriptors;

@end
