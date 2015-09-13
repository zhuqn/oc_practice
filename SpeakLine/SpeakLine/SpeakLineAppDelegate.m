//
//  AppDelegate.m
//  SpeakLine
//
//  Created by zqn on 15/9/12.
//  Copyright (c) 2015年 my.company. All rights reserved.
//

#import "SpeakLineAppDelegate.h"

@interface SpeakLineAppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation SpeakLineAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (instancetype)init{
    self = [super init];
    if (self) {
        NSLog(@"init");
        _speechSynth = [[NSSpeechSynthesizer alloc] initWithVoice:nil];
    }
    return self;
}

- (IBAction)sayIt:(id)sender {
    NSString *string = [_textField stringValue];
    
    if ([string length] == 0) {
        NSLog(@"string from %@ is of zero-length",_textField);
        return;
    }
    [_speechSynth startSpeakingString:string];
    NSLog(@"Have started to say:%@", string);
}


- (IBAction)stopIt:(id)sender {
    NSLog(@"stopping");
    [_speechSynth stopSpeaking];
}

@end
