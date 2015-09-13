//
//  CountCharAppDelegate.h
//  CountChar
//
//  Created by zqn on 15/9/12.
//  Copyright (c) 2015年 my.company. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CountCharAppDelegate : NSObject <NSApplicationDelegate>

@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSTextField *textShowField;

- (IBAction)showCountCharacter:(id)sender;

@end

