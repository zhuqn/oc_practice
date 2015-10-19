//
//  Document.m
//  RaiseManNoArrayController
//
//  Created by zqn on 15/10/14.
//  Copyright © 2015年 my.company. All rights reserved.
//

#import "Document.h"
#import "Person.h"

@interface Document ()

@end

@implementation Document

- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace {
    return YES;
}

- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return YES;
}

#pragma mark Action methods
- (IBAction)Add:(id)sender {
    Person *newEmployee = [[Person alloc] init];
    [employees addObject:newEmployee];
    [self.tableView reloadData];
}

- (IBAction)Del:(id)sender {
    NSIndexSet *rows = [self.tableView selectedRowIndexes];
    
    if ([rows count]==0) {
        NSBeep();
    }
    [employees removeObjectsAtIndexes:rows];
    [self.tableView reloadData];
    
}

#pragma mark tableView dataSource methods
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return [employees count];
}

-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    NSString *identifier = [tableColumn identifier];
    Person *person = [employees objectAtIndex:row];
    return [person valueForKey:identifier];
}

-(void)tableView:(NSTableView *)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    NSString *identifier = [tableColumn identifier];
    Person *person = [employees objectAtIndex:row];
    
    [person setValue:object forKey:identifier];
}

-(void)tableView:(NSTableView *)tableView sortDescriptorsDidChange:(NSArray<NSSortDescriptor *> *)oldDescriptors{
    NSArray *newDescriptors = [tableView sortDescriptors];
    NSLog(@"%@", newDescriptors);
    [employees sortUsingDescriptors:newDescriptors];
    
    
    [self.tableView reloadData];
}



@end
