//
//  colorFormattet.m
//  TypeTutor
//
//  Created by zqn on 2016/8/2.
//  Copyright © 2016年 my.company. All rights reserved.
//

#import "colorFormattet.h"
#import <AppKit/NSColor.h>

@interface colorFormattet()
- (NSString *)firstColorKeyForPartialString:(NSString *)string;
@end

@implementation colorFormattet

-(instancetype)init{
    self = [super init];
    if (self) {
        colorList = [NSColorList colorListNamed:@"Apple"];
    }
    return self;
}

- (NSString *)firstColorKeyForPartialString:(NSString *)string{
    if ([string length] == 0) {
        return nil;
    }
    
    for (NSString *key in [colorList allKeys]) {
        NSRange whereFound = [key rangeOfString:string
                                        options:NSCaseInsensitiveSearch];
        if ((whereFound.location == 0) && (whereFound.length > 0)) {
            return key;
        }
    }
    return nil;
}

-(NSString *)stringForObjectValue:(id)obj{
    if (![obj isKindOfClass:[NSColor class]]) {
        return nil;
    }
    
    //转换成RBG颜色
    NSColor *color;
    color = [obj colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
    
    //以浮点形式得到颜色组成
    CGFloat red,green,bule;
    [color getRed:&red
            green:&green
             blue:&bule
            alpha:NULL];
    
    //将距离初始化成较大的某值
    float minDistance = 3.0;
    NSString *closestKey = nil;
    
    //找到颜色列表中最接近的颜色
    for (NSString *key in [colorList allKeys]) {
        NSColor *c = [colorList colorWithKey:key];
        CGFloat r,g,b;
        [c getRed:&r
            green:&g
             blue:&b
            alpha:NULL];
        //计算color和c的距离
        float dist;
        dist = pow(red - r, 2) + pow(green - g, 2) + pow(bule - b, 2);
        
        //是否最接近的一个
        if (dist < minDistance) {
            minDistance = dist;
            closestKey = key;
        }
    }
    //以colsestkey返回最接近颜色的对象名
    return closestKey;
}

- (BOOL)getObjectValue:(out id  _Nullable __autoreleasing *)obj
             forString:(NSString *)string
      errorDescription:(out NSString *__autoreleasing  _Nullable *)error{
    //查找字符串对应的颜色
    NSString *matchingKey = [self firstColorKeyForPartialString:string];
    if (matchingKey) {
        *obj = [colorList colorWithKey:matchingKey];
        return YES;
    }
    else{
        if (error != NULL) {
            *error = [NSString stringWithFormat:@"is not a color",string];
        }
        return NO;
    }
}

- (BOOL)isPartialStringValid:(NSString *)partialString
            newEditingString:(NSString *__autoreleasing  _Nullable *)newString
            errorDescription:(NSString *__autoreleasing  _Nullable *)error{
    if ([partialString length] == 0) {
        return YES;
    }
    NSString *match = [self firstColorKeyForPartialString:partialString];
    if (match) {
        return YES;
    }
    else{
        if (error) {
            *error = @"No such color";
        }
        return NO;
    }
}

-(BOOL)isPartialStringValid:(NSString *__autoreleasing  _Nonnull *)partialStringPtr
      proposedSelectedRange:(NSRangePointer)proposedSelRangePtr
             originalString:(NSString *)origString
      originalSelectedRange:(NSRange)origSelRange
           errorDescription:(NSString *__autoreleasing  _Nullable *)error{
    if ([*partialStringPtr length] == 0) {
        return YES;
    }
    NSString *match = [self firstColorKeyForPartialString:*partialStringPtr];
    
    if (!match) {
        return NO;
    }
    
    //如果不移动selection的开头部分，那么就进行删除
    if (origSelRange.location == proposedSelRangePtr->location) {
        return YES;
    }
    
    //如果partial比需要匹配的字符串短，那么就提供匹配字符串，并设置selection
    if ([match length] != [*partialStringPtr length]) {
        proposedSelRangePtr->location = [*partialStringPtr length];
        proposedSelRangePtr->length = [match length] - proposedSelRangePtr->location;
        *partialStringPtr = match;
        return NO;
    }
    return YES;
}

@end
