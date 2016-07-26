//
//  BigLetterView.m
//  TypeTutor
//
//  Created by zqn on 16/7/18.
//  Copyright © 2016年 my.company. All rights reserved.
//

#import "BigLetterView.h"
#import "NSString+FirstLetter.h"

@implementation BigLetterView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    NSRect bounds = [self bounds];
    [bgColor set];
    [NSBezierPath fillRect:bounds];
    
    if (highlighted) {
        NSGradient *gr;
        gr = [[NSGradient alloc] initWithStartingColor:[NSColor whiteColor] endingColor:bgColor];
        [gr drawInRect:bounds relativeCenterPosition:NSZeroPoint];
    }
    else{
        [bgColor set];
        [NSBezierPath fillRect:bounds];
    }
    
    [self drawStringCenteredIn:bounds];
    
    NSSize strSize = [string sizeWithAttributes:attributes];
//    [shadow setShadowOffset:strSize];
//    [shadow setShadowColor:[NSColor whiteColor]];
    
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
        [self prepareAttributes];
        bgColor = [NSColor yellowColor];
        string = @"";
        shadow = [[NSShadow alloc] init];
        
        [self registerForDraggedTypes:[NSArray arrayWithObject:NSPasteboardTypeString]];
    }
    return self;
}

-(IBAction)savePDF:(id)sender{
    __block NSSavePanel *panel = [NSSavePanel savePanel];
    [panel setAllowedFileTypes:[NSArray arrayWithObjects:@"pdf", nil]];
    
    [panel beginSheetModalForWindow:[self window] completionHandler:^(NSInteger result) {
        if (result == NSOKButton) {
            NSRect r = [self bounds];
            NSData *data = [self dataWithPDFInsideRect:r];
            NSError *error;
            BOOL successful = [data writeToURL:[panel URL]
                                       options:0
                                         error:&error];
            if (!successful) {
                NSAlert *a = [NSAlert alertWithError:error];
                [a runModal];
            }
        }
        panel = nil;
    }];
}

- (NSDragOperation)draggingSourceOperationMaskForLocal:(BOOL)flag{
    return NSDragOperationCopy|NSDragOperationDelete;
}

-(void)draggedImage:(NSImage *)image endedAt:(NSPoint)screenPoint operation:(NSDragOperation)operation{
    if (operation == NSDragOperationDelete) {
        [self setString:@""];
    }
}

-(void)mouseDown:(NSEvent *)theEvent{
    mouseDownEvent = theEvent;
}

-(void)mouseDragged:(NSEvent *)theEvent{
    NSPoint down = [mouseDownEvent locationInWindow];
    NSPoint drag = [theEvent locationInWindow];
    float distance = hypotf(down.x - drag.x, down.y-drag.y);
    if (distance<3) {
        return;
    }
    
    if ([string length]==0) {
        return;
    }
    
    NSSize s = [string sizeWithAttributes:attributes];
    
    //创建需要拖拽操作的图片
    NSImage *anImage = [[NSImage alloc] initWithSize:s];
    
    //在将要绘制字符的图片上创建一个矩形区域
    NSRect imageBounds;
    imageBounds.origin = NSZeroPoint;
    imageBounds.size = s;
    
    //在图片上绘制字符
    [anImage lockFocus];
    [self drawStringCenteredIn:imageBounds];
    [anImage unlockFocus];
    
    //获取mousedowe事件的位置
    NSPoint p = [self convertPoint:down fromView:nil];
    
    //从图片中心开始拖动
    p.x = p.x - s.width/2;
    p.y = p.y - s.height/2;
    
    //获取剪切板
    NSPasteboard *pb = [NSPasteboard pasteboardWithName:NSDragPboard];
    //将字符放到剪切板上
    [self writeToPasteboard:pb];
    
    //开始拖操作
    [self dragImage:anImage
                 at:p
             offset:NSZeroSize
              event:mouseDownEvent
         pasteboard:pb
             source:self
          slideBack:YES];
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

- (void)prepareAttributes{
    NSFont *aFont = [NSFont userFontOfSize:75];
    NSFontManager *fontManager = [NSFontManager sharedFontManager];
    aFont = [fontManager convertFont:aFont toHaveTrait:NSBoldFontMask];
    
    attributes = [NSMutableDictionary dictionary];
    [attributes setObject:aFont forKey:NSFontAttributeName];
    [attributes setObject:[NSColor redColor] forKey:NSForegroundColorAttributeName];
}

- (void)drawStringCenteredIn:(NSRect)r{
    NSSize strSize = [string sizeWithAttributes:attributes];
    NSPoint strOrigin;
    strOrigin.x = r.origin.x + (r.size.width - strSize.width)/2;
    strOrigin.y = r.origin.y + (r.size.height - strSize.height)/2;
    [string drawAtPoint:strOrigin withAttributes:attributes];
}

- (void)writeToPasteboard:(NSPasteboard *)pb{
    //复制数据到剪切板
    [pb clearContents];
    [pb writeObjects:[NSArray arrayWithObject:string]];
}

- (BOOL)readFromPasteboard:(NSPasteboard *)pb{
    NSArray *classes = [NSArray arrayWithObject:[NSString class]];
    NSArray *objects = [pb readObjectsForClasses:classes options:nil];
    
    if ([objects count]>0) {
        //从剪切板中读取数据
        NSString *value = [objects objectAtIndex:0];

        [self setString:[value bnr_firstLetter]];
        return YES;
    }
    return NO;
}

-(IBAction)cut:(id)sender{
    [self copy:sender];
    [self setString:@""];
}

-(IBAction)copy:(id)sender{
    NSPasteboard *pb = [NSPasteboard generalPasteboard];
    [self writeToPasteboard:pb];
}

-(IBAction)paste:(id)sender{
    NSPasteboard *pb = [NSPasteboard generalPasteboard];
    if (![self readFromPasteboard:pb]) {
        NSBeep();
    }
}

#pragma mark - Accessors
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
    [self setNeedsDisplay:YES];
}

- (NSString *)string{
    return string;
}

#pragma mark Dragging Destination
- (NSDragOperation)draggingEntered:(id<NSDraggingInfo>)sender{
    NSLog(@"draggingEntered:");
    if ([sender draggingSource] == self) {
        return NSDragOperationNone;
    }
    
    highlighted = YES;
    [self setNeedsDisplay:YES];
    return NSDragOperationCopy;
}

- (void)draggingExited:(id<NSDraggingInfo>)sender{
    NSLog(@"draggingExited");
    highlighted = NO;
    [self setNeedsDisplay:YES];
}

- (BOOL)prepareForDragOperation:(id<NSDraggingInfo>)sender{
    return YES;
}

- (BOOL)performDragOperation:(id<NSDraggingInfo>)sender{
    NSPasteboard *pb = [sender draggingPasteboard];
    if (![self readFromPasteboard:pb]) {
        NSLog(@"Error:Could not read from dragging pasteboard");
        return NO;
    }
    return YES;
}

-(void)concludeDragOperation:(id<NSDraggingInfo>)sender{
    NSLog(@"concludeDragOperation:");
    highlighted = NO;
    [self setNeedsDisplay:YES];
}

-(NSDragOperation)draggingUpdated:(id<NSDraggingInfo>)sender{
    NSDragOperation op = [sender draggingSourceOperationMask];
    NSLog(@"operation mask = %ld",op);
    if ([sender draggingSource] == self) {
        return NSDragOperationNone;
    }
    return NSDragOperationCopy;
}

@end
