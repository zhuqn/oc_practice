//
//  AppDelegate.h
//  iPing
//
//  Created by zqn on 16/3/24.
//  Copyright © 2016年 my.company. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    IBOutlet NSTextView *outputView;
    IBOutlet NSTextField *hostField;
    IBOutlet NSButton *startButton;
    NSTask *task;
    NSPipe *pipe;
}
@property (assign) IBOutlet NSWindow *window;

- (IBAction)startStopPing:(id)sender;



@end

