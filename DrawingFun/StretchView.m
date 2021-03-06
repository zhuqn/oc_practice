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
//        for (i=0; i<15; i++) {
//            p = [self randomPoint];
//            [path lineToPoint:p];
////            [path relativeLineToPoint:p];
////            [path curveToPoint:p controlPoint1:p controlPoint2:p];
//        }
        [path curveToPoint:NSMakePoint(100, 100) controlPoint1:NSMakePoint(300, 300) controlPoint2:NSMakePoint(100, 600)];
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

-(void)mouseDown:(NSEvent *)theEvent
{
    NSLog(@"mouseDown %ld", [theEvent clickCount]);
}

-(void)mouseDragged:(NSEvent *)theEvent
{
    NSPoint p = [theEvent locationInWindow];
    NSLog(@"mouseDragged:%@",NSStringFromPoint(p));
}

-(void)mouseUp:(NSEvent *)theEvent
{
    NSLog(@"mouseUp:");
}

@end
