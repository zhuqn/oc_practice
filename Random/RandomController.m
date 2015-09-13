//
//  RandomController.m
//  Random
//
//  Created by zqn on 15/9/8.
//  Copyright (c) 2015年 my.company. All rights reserved.
//

#import "RandomController.h"

@implementation RandomController
- (void)awakeFromNib
{
    NSDate *now;
    now = [NSDate date];
    [textField setObjectValue:now];
}

- (void)seed:(id)sender
{
    int generated;
    generated = (int)(random()%100)+1;
    NSLog(@"generator = %d",generated);
    [textField setIntValue:generated];
}

- (void)generate:(id)sender
{
    srandom((unsigned)time(NULL));
    [textField setStringValue:@"Generator seeded"];
}

@end
