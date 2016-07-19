//
//  BigLetterView.m
//  TypeTutor
//
//  Created by zqn on 16/7/18.
//  Copyright © 2016年 my.company. All rights reserved.
//

#import "BigLetterView.h"

@implementation BigLetterView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    NSRect bounds = [self bounds];
    [bgColor set];
    [NSBezierPath fillRect:bounds];
    
    if (([[self window] firstResponder] == self)&&[NSGraphicsContext currentContextDrawingToScreen])
    {
        [NSGraphicsContext saveGraphicsState];
        NSSetFocusRingStyle(NSFocusRingOnly);
        [NSBezierPath fillRect:bounds];
        [NSGraphicsContext restoreGraphicsState];
        
//        [[NSColor keyboardFocusIndicatorColor] set];
//        [NSBezierPath setDefaultLineWidth:4.0];
//        [NSBezierPath strokeRect:bounds];
    }
    
    if (isHighlighted) {
        NSLog(@"isHighlighted");
    }
    else
    {
        NSLog(@"not isHighlighted");
    }
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        NSLog(@"initializing");
        bgColor = [NSColor yellowColor];
        string = @"";
    }
    return self;
}

- (BOOL)isOpaque{
    return YES;
}

- (BOOL)acceptsFirstResponder{
    NSLog(@"Accepting");
    return YES;
}

- (BOOL)resignFirstResponder{
    NSLog(@"Resigning");
    [self setKeyboardFocusRingNeedsDisplayInRect:[self bounds]];
    return YES;
}

- (BOOL)becomeFirstResponder{
    NSLog(@"Becoming");
    [self setNeedsDisplay:YES];
    return YES;
}

- (void)keyDown:(NSEvent *)theEvent{
    [self interpretKeyEvents:[NSArray arrayWithObject:theEvent]];
}

- (void)insertText:(id)insertString{
    [self setString:insertString];
}

- (void)insertTab:(id)sender{
    [[self window] selectKeyViewFollowingView:self];
}

- (void)insertBacktab:(id)sender{
    [[self window] selectKeyViewPrecedingView:self];
}

- (void)deleteBackward:(id)sender{
    [self setString:@""];
}

-(void) viewDidMoveToWindow{
    int options = NSTrackingMouseEnteredAndExited|
                  NSTrackingActiveAlways|
                  NSTrackingInVisibleRect;
    NSTrackingArea *ta;
    ta = [[NSTrackingArea alloc] initWithRect:NSZeroRect
                                      options:options
                                        owner:self
                                     userInfo:nil];
    [self addTrackingArea:ta];
}

- (void)mouseEntered:(NSEvent *)theEvent{
    isHighlighted = YES;
    [self setNeedsDisplay:YES];
}

- (void)mouseExited:(NSEvent *)theEvent{
    isHighlighted = NO;
    [self setNeedsDisplay:YES];
}

#pragma mark Accessors
- (void)setBgColor:(NSColor *)c{
    bgColor = c;
    [self setNeedsDisplay:YES];
}

- (NSColor *)bgColor{
    return bgColor;
}

- (void)setString:(NSString *)c{
    string = c;
    NSLog(@"The string is now %@", string);
}

- (NSString *)string{
    return string;
}

@end
