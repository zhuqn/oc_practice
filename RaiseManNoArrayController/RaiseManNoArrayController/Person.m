//
//  Person.m
//  RaiseManNoArrayController
//
//  Created by zqn on 15/10/14.
//  Copyright © 2015年 my.company. All rights reserved.
//

#import "Person.h"

@implementation Person

-(instancetype)init{
    self = [super init];
    if (self) {
        self.personName = @"New Person";
        self.expectedRaise = 0.05;
    }
}

@end
