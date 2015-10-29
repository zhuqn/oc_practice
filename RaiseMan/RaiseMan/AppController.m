//
//  AppController.m
//  RaiseMan
//
//  Created by zqn on 15/10/25.
//  Copyright © 2015年 my.company. All rights reserved.
//

#import "AppController.h"
#import "PreferenceController.h"
#import "AboutController.h"

@implementation AppController

+(void)initialize
{
    //创建字典
    NSMutableDictionary *defaultValues = [NSMutableDictionary dictionary];
    
    //归档颜色对象
    NSData *colorAsData = [NSKeyedArchiver archivedDataWithRootObject:[NSColor yellowColor]];
    
    //将default放在字典中
    [defaultValues setObject:colorAsData forKey:BNRTableBgColorKey];
    [defaultValues setObject:[NSNumber numberWithBool:YES] forKey:BNREmptyDocKey];
    
    [[NSUserDefaults standardUserDefaults]registerDefaults:defaultValues];
    NSLog(@"register defaults: %@",defaultValues);
    
}

-(BOOL)applicationShouldOpenUntitledFile:(NSApplication *)sender
{
    NSLog(@"applicationShouldOpenUntitledFile:");
    return [PreferenceController preferenceEmptyDoc];
}

-(IBAction)showPreferencePanel:(id)sender{
    if (!preferenceController) {
        preferenceController = [[PreferenceController alloc]init];
    }
    NSLog(@"showing %@",preferenceController);
    [preferenceController showWindow:self];
}

-(IBAction)showAboutPanel:(id)sender
{
    if (!aboutController) {
        aboutController = [[AboutController alloc] init];
    }
    NSLog(@"showing %@",aboutController);
    [aboutController showWindow:self];
}

@end
