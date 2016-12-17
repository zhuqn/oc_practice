//
//  AppDelegate.m
//  RanchForecast
//
//  Created by zqn on 2016/8/24.
//  Copyright © 2016年 my.company. All rights reserved.
//

#import "AppDelegate.h"
#import "ScheduleFetcher.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    ScheduleFetcher *fetcher = [[ScheduleFetcher alloc] init];
    NSError *error = nil;
    [fetcher fetchClassesWithError:&error];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
