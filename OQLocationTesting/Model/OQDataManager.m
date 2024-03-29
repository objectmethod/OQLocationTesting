#import "OQDataManager.h"
#import "OQAppProperties.h"

@implementation OQDataManager

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

+ (instancetype)sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)insertNewObjectForEntityForClass:(Class)class {
    NSString *entityName = NSStringFromClass(class);
    NSManagedObject *managedObject = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:self.managedObjectContext];
    return managedObject;
}

- (NSUInteger) countOfObjectsForEntityForClass:(Class)class {
    NSString *entityName = NSStringFromClass(class);
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:entityName inManagedObjectContext:self.managedObjectContext]];
    
    [request setIncludesSubentities:NO];
    
    NSError *err;
    NSUInteger count = [self.managedObjectContext countForFetchRequest:request error:&err];
    
    if (count == NSNotFound) {
        NSLog(@"error counting objects: %@", err.localizedDescription);
    }
    
    return count;
}

- (void)deleteAllObjectsForEntityForClass:(Class)class {
    NSString *entityName = NSStringFromClass(class);
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[NSEntityDescription entityForName:entityName inManagedObjectContext:self.managedObjectContext]];
    [fetchRequest setIncludesPropertyValues:NO];
    
    NSError * error = nil;
    NSArray *objects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"error fetching objects: %@", error.localizedDescription);
    }
    
    for (NSManagedObject *object in objects) {
        [self.managedObjectContext deleteObject:object];
    }
    
    [self saveContext];
}

- (NSArray *)getAllObjectsForEntityForClass:(Class)class {
    return [self getAllObjectsForEntityForClass:class predicate:nil];
}

- (NSArray *)getAllObjectsForEntityForClass:(Class)class predicate:(NSPredicate *)predicate {
    return [self getAllObjectsForEntityForClass:class predicate:predicate maxNumberOfEntities:0];
}

- (NSArray *)getAllObjectsForEntityForClass:(Class)class predicate:(NSPredicate *)predicate maxNumberOfEntities:(NSUInteger)maxNumberOfEntities {
    return [self getAllObjectsForEntityForClass:class predicate:predicate maxNumberOfEntities:maxNumberOfEntities sortDescriptors:nil];
}

- (NSArray *)getAllObjectsForEntityForClass:(Class)class predicate:(NSPredicate *)predicate maxNumberOfEntities:(NSUInteger)maxNumberOfEntities sortDescriptors:(NSArray *)sortDescriptors {
    NSString *entityName = NSStringFromClass(class);
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:entityName inManagedObjectContext:self.managedObjectContext]];
    
    [request setIncludesSubentities:NO];
    
    if (predicate) {
        request.predicate = predicate;
    }
    
    if (maxNumberOfEntities > 0) {
        request.fetchLimit = maxNumberOfEntities;
    }
    
    if (sortDescriptors.count > 0) {
        request.sortDescriptors = sortDescriptors;
    }
    
    NSError *error;
    NSArray *entities = [self.managedObjectContext executeFetchRequest:request error:&error];
    
    if (error) {
        DLog(@"error executing fetch request: %@", error);
    }
    
    return entities;
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"OQLocationTesting" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[[OQAppProperties sharedInstance] applicationDocumentsDirectory] URLByAppendingPathComponent:@"OQLocationTesting.sqlite"];
    
    NSDictionary *options = @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES};
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
