//
//  PreferenceController.m
//  RaiseMan
//
//  Created by zqn on 15/10/25.
//  Copyright © 2015年 my.company. All rights reserved.
//

#import "PreferenceController.h"

NSString * const BNRTableBgColorKey = @"BNRTableBackgroundColor";
NSString * const BNREmptyDocKey = @"BNREmptyDocumentFlag";
NSString * const BNRColorChangedNotification = @"BNRColorChanged";

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
    
    [colorWell setColor:[PreferenceController preferenceTableBgColor]];
    [checkBox setState:[PreferenceController preferenceEmptyDoc]];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

-(IBAction)changeBackgroundColor:(id)sender
{
    NSColor *color = [colorWell color];
    [PreferenceController setPreferenceTableBgColor:color];
    NSLog(@"Color changed:%@",color);
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    NSLog(@"Sending notification");
    
    NSDictionary *d = [NSDictionary dictionaryWithObject:color forKey:@"color"];
    
//    [nc postNotificationName:BNRColorChangedNotification object:self];
    [nc postNotificationName:BNRColorChangedNotification object:self userInfo:d];
}

-(IBAction)changeNewEmptyDoc:(id)sender
{
    NSInteger state = [checkBox state];
    [PreferenceController setPreferenceEmptyDoc:state];
    NSLog(@"Checkbox changed %ld",state);
}

+(NSColor*)preferenceTableBgColor
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *colorAsData = [defaults objectForKey:BNRTableBgColorKey];
    return [NSKeyedUnarchiver unarchiveObjectWithData:colorAsData];
}

+(void)setPreferenceTableBgColor:(NSColor *)color
{
    NSData *colorAsData = [NSKeyedArchiver archivedDataWithRootObject:color];
    [[NSUserDefaults standardUserDefaults]setObject:colorAsData forKey:BNRTableBgColorKey];
}

+(BOOL)preferenceEmptyDoc
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:BNREmptyDocKey];
}

+(void)setPreferenceEmptyDoc:(BOOL)emptyDoc
{
    [[NSUserDefaults standardUserDefaults]setBool:emptyDoc forKey:BNREmptyDocKey];
}

@end
