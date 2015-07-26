//
//  BNRContainer.m
//  RandomItems
//
//  Created by zqn on 15/7/26.
//  Copyright (c) 2015年 my.company. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer

- (NSString *)description
{
    int count=0;
    NSString *subDescriptString = [NSString alloc];
    for (BNRItem *item in subitems) {
        count+=item.valueInDollars;
        [subDescriptString stringByAppendingString:item.description];
    }
    count+=self.valueInDollars;
    
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ %d %@",self.itemName,count,subDescriptString];
    
    return descriptionString;
}

@end
