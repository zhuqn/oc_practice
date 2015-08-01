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
    CGRect bounds = self.bounds;
    CGPoint center;
    center.x=bounds.origin.x+bounds.size.width/2.0;
    center.y=bounds.origin.y+bounds.size.height/2.0;

    float maxRadius=hypotf(bounds.size.width, bounds.size.height)/2.0;
    UIBezierPath *path=[[UIBezierPath alloc] init];

    for (float currentRadius=maxRadius; currentRadius>0; currentRadius-=20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];//移动笔的位置
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI*2.0
                     clockwise:YES];
    }
    path.lineWidth=10;
    [[UIColor lightGrayColor] setStroke];
    [path stroke];
    
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    CGRect paintImage = CGRectMake(bounds.origin.x+50, bounds.origin.y+100, bounds.size.width-100, bounds.size.height-200);
    [logoImage drawInRect:paintImage];
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
