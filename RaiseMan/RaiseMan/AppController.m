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
