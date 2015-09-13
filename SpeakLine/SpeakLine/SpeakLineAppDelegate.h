//
//  AppDelegate.h
//  SpeakLine
//
//  Created by zqn on 15/9/12.
//  Copyright (c) 2015年 my.company. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SpeakLineAppDelegate : NSObject <NSApplicationDelegate>
{
    NSSpeechSynthesizer *_speechSynth;
}

@property (weak) IBOutlet NSTextField *textField;

- (IBAction)stopIt:(id)sender;
- (IBAction)sayIt:(id)sender;
@end

