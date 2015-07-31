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
    
//    float radius = (MIN(bounds.size.width, bounds.size.height)/2.0);
    
    float maxRadius=hypotf(bounds.size.width, bounds.size.height)/2.0;
    
    UIBezierPath *path=[[UIBezierPath alloc] init];
//    [path addArcWithCenter:center
//                    radius:radius startAngle:0
//                  endAngle:M_PI*2
//                 clockwise:YES];
    
    for (float currentRadius=maxRadius; currentRadius>0; currentRadius-=20) {
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI*2.0
                     clockwise:YES];
    }
    
    
    path.lineWidth=10;
    
    [[UIColor lightGrayColor] setStroke];
    
    [path stroke];
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
