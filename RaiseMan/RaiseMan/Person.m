//
//  Person.m
//  RaiseMan
//
//  Created by zqn on 15/9/24.
//  Copyright © 2015年 my.company. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize personName;
@synthesize expectedRaise;

- (instancetype)init{
    self=[super init];
    if (self) {
        expectedRaise=0.05;
        personName=@"New Person";
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        personName = [coder decodeObjectForKey:@"personName"];
        expectedRaise = [coder decodeFloatForKey:@"expectedRaise"];
    }
    return self;
}

- (void)setNilValueForKey:(NSString *)key{
    if ([key isEqual:@"expectedRaise"]) {
        [self setExpectedRaise:0.0];
    }
    else{
        [super setNilValueForKey:key];
    }
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:personName forKey:@"personName"];
    [coder encodeFloat:expectedRaise forKey:@"expectedRaise"];
}

@end
