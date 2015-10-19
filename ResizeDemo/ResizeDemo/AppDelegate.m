//
//  AppDelegate.m
//  ResizeDemo
//
//  Created by zqn on 15/9/15.
//  Copyright (c) 2015年 my.company. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (NSSize)windowWillResize:(NSWindow *)sender toSize:(NSSize)frameSize{
    NSSize mysize = NSMakeSize(frameSize.width, frameSize.width*2);
    return mysize;
}

- (IBAction)Delete:(id)sender {
}
@end
