//
//  RMDocument.h
//  RaiseMan
//
//  Created by zqn on 15/9/24.
//  Copyright © 2015年 my.company. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class Person;

@interface RMDocument : NSDocument{
    NSMutableArray *employees;
    
    IBOutlet NSTableView *tableView;
    IBOutlet NSArrayController *employeeController;
}
- (IBAction)creatEmployee:(id)sender;

- (void)setEmployees:(NSMutableArray *)a;

-(void)insertObject:(Person *)p inEmployeesAtIndex:(NSUInteger)index;
-(void)removeObjectFromEmployeesAtIndex:(NSUInteger)index;

@end

