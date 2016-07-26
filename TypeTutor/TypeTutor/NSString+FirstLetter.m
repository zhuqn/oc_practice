//
//  NSString+FirstLetter.m
//  TypeTutor
//
//  Created by zqn on 2016/7/25.
//  Copyright © 2016年 my.company. All rights reserved.
//

#import "NSString+FirstLetter.h"

@implementation NSString (FirstLetter)

- (NSString *)bnr_firstLetter{
    if ([self length] < 2) {
        return self;
    }
    NSRange r;
    r.location = 0;
    r.length = 1;
    return [self substringWithRange:r];
}

@end
