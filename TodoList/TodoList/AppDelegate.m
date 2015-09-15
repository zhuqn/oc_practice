//
//  AppDelegate.m
//  TodoList
//
//  Created by zqn on 15/9/15.
//  Copyright (c) 2015年 my.company. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

-(instancetype)init{
    self = [super init];
    if (self) {
        _todoArray = [[NSMutableArray alloc] init];
        
    }
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)addList:(id)sender{
    [_todoArray addObject:[self.textField stringValue]];
    [_tableView reloadData];
}

#pragma mark tableview delegate

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return (NSInteger)[_todoArray count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    NSString *v = [_todoArray objectAtIndex:row];
    //    NSLog(@"%@",dict);
    return v;
}

- (void)tableView:(NSTableView *)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    [_todoArray replaceObjectAtIndex:row withObject:object];
}

@end
