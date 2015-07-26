//
//  main.m
//  RandomItems
//
//  Created by zqn on 15/7/22.
//  Copyright (c) 2015年 my.company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSMutableArray *items = [[NSMutableArray alloc] init];
//        [items addObject:@"One"];
//        [items addObject:@"Two"];
//        [items addObject:@"Three"];
//        
//        [items insertObject:@"Zero" atIndex:0];
//        
//        for (NSString *item in items) {
//            NSLog(@"%@",item);
//        }
//  
//        BNRItem *item = [[BNRItem alloc]initWithItemName:@"Red Soft" valueInDollars:100 serialNumber:@"A1B2C"];
//        NSLog(@"%@", item);
//        
//        BNRItem *itemWithName = [[BNRItem alloc] initWithItemName:@"Blue Soft"];
//        NSLog(@"%@", itemWithName);
//        
//        BNRItem *itemWithNoName = [[BNRItem alloc] init];
//        NSLog(@"%@", itemWithNoName);
//        
//        
//        items=nil;
//        for (int n=0; n<10; n++) {
//            BNRItem *item=[BNRItem randomItem];
//            [items addObject:item];
//        }
//        BNRItem* itemObj = items[10];
//        NSLog(@"%@",itemObj);
//        id lastObj = [items lastObject];
//        [lastObj count];
        
//        for (id item in items) {
//            NSLog(@"%@",item);
//        }
        BNRItem *backpack=[[BNRItem alloc] initWithItemName:@"Backpack"];
        [items addObject:backpack];
        
        BNRItem *calculator=[[BNRItem alloc] initWithItemName:@"Calculator"];
        [items addObject:calculator];
        
        backpack.containedItem=calculator;
        
        backpack=nil;
        calculator=nil;
        
        for (BNRItem *item in items) {
            NSLog(@"%@", item);
        }
        
        NSLog(@"Setting items to nil...");
        items=nil;
        
    }
    return 0;
}
