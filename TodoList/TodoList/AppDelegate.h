//
//  AppDelegate.h
//  TodoList
//
//  Created by zqn on 15/9/15.
//  Copyright (c) 2015年 my.company. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate,NSTableViewDataSource,NSTableViewDelegate>
{
    NSMutableArray* _todoArray;
}

@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSTableView *tableView;

- (IBAction)addList:(id)sender;

@end

