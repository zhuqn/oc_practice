//
//  PreferenceController.m
//  RaiseMan
//
//  Created by zqn on 15/10/25.
//  Copyright © 2015年 my.company. All rights reserved.
//

#import "PreferenceController.h"

@interface PreferenceController ()

@end

@implementation PreferenceController

- (instancetype)init{
    self = [super initWithWindowNibName:@"Preferences"];
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    NSLog(@"Nib file is loaded");
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

-(IBAction)changeBackgroundColor:(id)sender
{
    NSColor *color = [colorWell color];
    NSLog(@"Color changed:%@",color);
}

-(IBAction)changeNewEmptyDoc:(id)sender
{
    NSInteger state = [checkBox state];
    NSLog(@"Checkbox changed %ld",state);
}

@end
