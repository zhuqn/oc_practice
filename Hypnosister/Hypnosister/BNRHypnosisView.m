//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by zqn on 15/7/30.
//  Copyright (c) 2015年 my.company. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView
- (void)drawRect:(CGRect)rect
{
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    CGContextSetShadow(currentContext, CGSizeMake(4, 7), 3);
    
    CGRect bounds = self.bounds;
    
    CGFloat location[2]={0.0,1.0};
    CGFloat components[8]={1.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0.0, 1.0};
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, location, 2);
    
    CGPoint startPoint=CGPointMake(bounds.origin.x, bounds.origin.y);
    CGPoint endPoint=CGPointMake(bounds.origin.x+bounds.size.width, bounds.origin.y+bounds.size.height);
    
    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
    }
    return self;
}
@end
