//
//  Document.h
//  RaiseManNoArrayController
//
//  Created by zqn on 15/10/14.
//  Copyright © 2015年 my.company. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Document : NSDocument<NSTableViewDataSource>{
    NSMutableArray *employees;
}

- (IBAction)Add:(id)sender;
- (IBAction)Del:(id)sender;
@property (weak) IBOutlet NSTableView *tableView;

@end

