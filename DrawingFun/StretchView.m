//
//  StretchView.m
//  DrawingFun
//
//  Created by zqn on 15/11/4.
//  Copyright © 2015年 my.company. All rights reserved.
//

#import "StretchView.h"

@implementation StretchView


- (instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (self) {
        srandom((unsigned)time(NULL));
        
        path = [NSBezierPath bezierPath];
        [path setLineWidth:3.0];
        NSPoint p = [self randomPoint];
        [path moveToPoint:p];
        int i;
        for (i=0; i<15; i++) {
            p = [self randomPoint];
            [path lineToPoint:p];
        }
        [path closePath];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    NSRect bounds = [self bounds];
    
    [[NSColor greenColor]set];
    [NSBezierPath fillRect:bounds];
    
    [[NSColor whiteColor]set];
    [path stroke];
//    [path fill];
}

- (NSPoint)randomPoint
{
    NSPoint result;
    NSRect r = [self bounds];
    result.x = r.origin.x + random()%(int)r.size.width;
    result.y = r.origin.y + random()%(int)r.size.height;
    return result;
}
@end
