//
//  AppDelegate.m
//  iPing
//
//  Created by zqn on 16/3/24.
//  Copyright © 2016年 my.company. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)startStopPing:(id)sender
{
    //任务还在运行吗？
    if (task) {
        [task interrupt];
    }
    else
    {
        task = [[NSTask alloc] init];
        [task setLaunchPath:@"/sbin/ping"];
        NSArray *args = [NSArray arrayWithObjects:@"-c10", [hostField stringValue], nil];
        [task setArguments:args];
        
        //创建一个新的pipe
        pipe = [[NSPipe alloc] init];
        [task setStandardOutput:pipe];
        
        NSFileHandle *fh = [pipe fileHandleForReading];
        
        NSNotificationCenter *nc;
        nc = [NSNotificationCenter defaultCenter];
        [nc removeObserver:self];
        [nc addObserver:self
               selector:@selector(dataReady:)
                   name:NSFileHandleReadCompletionNotification
                 object:fh];
        [nc addObserver:self
               selector:@selector(taskTerminated:)
                   name:NSTaskDidTerminateNotification
                 object:task];
        [task launch];
        [outputView setString:@""];
        
        [fh readInBackgroundAndNotify];
    }
}

-(void)appendData:(NSData *)d
{
    NSString *s = [[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];
    
    NSTextStorage *ts = [outputView textStorage];
    [ts replaceCharactersInRange:NSMakeRange([ts length], 0) withString:s];
}

-(void)dataReady:(NSNotification *)n
{
    NSData *d;
    d = [[n userInfo] valueForKey:NSFileHandleNotificationDataItem];
    
    NSLog(@"daraReady:%ld bytes", [d length]);
    
    if ([d length]) {
        [self appendData:d];
    }
    //如果任务还在运行，再次开始读取数据
    if (task) {
        [[pipe fileHandleForReading] readInBackgroundAndNotify];
    }
}

-(void)taskTerminated:(NSNotification *)note
{
    NSLog(@"taskTerminated:");
    
    task = nil;
    
    [startButton setState:0];
}

@end
