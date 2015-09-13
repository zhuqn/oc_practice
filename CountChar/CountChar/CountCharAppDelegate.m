//
//  CountCharAppDelegate.m
//  CountChar
//
//  Created by zqn on 15/9/12.
//  Copyright (c) 2015年 my.company. All rights reserved.
//

#import "CountCharAppDelegate.h"

@interface CountCharAppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation CountCharAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)showCountCharacter:(id)sender {
    NSString *text = [_textField stringValue];
    NSUInteger count = [text length];
    NSLog(@"%@",text);
    NSLog(@"%lu",(unsigned long)count);
    
    [_textShowField setStringValue:[NSString stringWithFormat:@"\'%@\' has %lu characters.",text,(unsigned long)count]];
}
@end
