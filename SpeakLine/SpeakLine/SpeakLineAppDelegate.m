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
        
        [_speechSynth setDelegate:self];
        _voices = [NSSpeechSynthesizer availableVoices];
    }
    return self;
}

- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender didFinishSpeaking:(BOOL)finishedSpeaking{
    [_stopButton setEnabled:false];
    [_speakButton setEnabled:true];
    [_tableView setEnabled:true];
    NSLog(@"finishSpeaking=%d", finishedSpeaking);
}

- (void)awakeFromNib{
    NSString *defaultVoice = [NSSpeechSynthesizer defaultVoice];
    NSInteger defaultRow = [_voices indexOfObject:defaultVoice];
    NSIndexSet *indices = [NSIndexSet indexSetWithIndex:defaultRow];
    [_tableView selectRowIndexes:indices byExtendingSelection:NO];
    [_tableView scrollRowToVisible:defaultRow];
}

#pragma mark tableview delegate

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return (NSInteger)[_voices count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    NSString *v = [_voices objectAtIndex:row];
    NSDictionary *dict = [NSSpeechSynthesizer attributesForVoice:v];
//    NSLog(@"%@",dict);
    return [dict objectForKey:NSVoiceName];
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification{
    NSInteger row = [_tableView selectedRow];
    if (row == -1) {
        return;
    }
    NSString *selectVoice = [_voices objectAtIndex:row];
    [_speechSynth setVoice:selectVoice];
    NSLog(@"new voice=%@",selectVoice);
}

#pragma mark action

- (IBAction)sayIt:(id)sender {
    NSString *string = [_textField stringValue];
    
    if ([string length] == 0) {
        NSLog(@"string from %@ is of zero-length",_textField);
        return;
    }
    [_stopButton setEnabled:true];
    [_speakButton setEnabled:false];
    [_speechSynth startSpeakingString:string];
    [_tableView setEnabled:false];
    NSLog(@"Have started to say:%@", string);
}


- (IBAction)stopIt:(id)sender {
    NSLog(@"stopping");
    [_speechSynth stopSpeaking];
}

@end
