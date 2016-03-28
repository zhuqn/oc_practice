//
//  AppDelegate.h
//  Scattered
//
//  Created by zqn on 16-3-24.
//  Copyright (c) 2016年 zqn. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    IBOutlet NSView *view;
    CATextLayer *textLayer;
    
    NSOperationQueue *processingQueue;
}
@property (assign) IBOutlet NSWindow *window;

@end

