//
//  StretchView.h
//  DrawingFun
//
//  Created by zqn on 15/11/4.
//  Copyright © 2015年 my.company. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface StretchView : NSView{
    NSBezierPath *path;
}

-(NSPoint)randomPoint;

@end
