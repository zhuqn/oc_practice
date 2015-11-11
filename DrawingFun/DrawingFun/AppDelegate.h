//
//  AppDelegate.h
//  DrawingFun
//
//  Created by zqn on 15/11/4.
//  Copyright © 2015年 my.company. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "StretchView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (weak) IBOutlet StretchView *mainView;
- (IBAction)AddView:(id)sender;

@end

