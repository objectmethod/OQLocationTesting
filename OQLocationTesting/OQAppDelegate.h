//
//  OQAppDelegate.h
//  OQLocationTesting
//
//  Created by Richard Guy on 5/26/14.
//  Copyright (c) 2014 OQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OQAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
