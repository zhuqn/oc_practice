//
//  AboutController.m
//  RaiseMan
//
//  Created by zqn on 15/10/25.
//  Copyright © 2015年 my.company. All rights reserved.
//

#import "AboutController.h"

@interface AboutController ()

@end

@implementation AboutController

- (instancetype)init
{
    self = [super initWithWindowNibName:@"About"];
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    NSLog(@"Nib file is loaded");
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

@end
