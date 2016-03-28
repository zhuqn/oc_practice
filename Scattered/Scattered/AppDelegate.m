//
//  AppDelegate.m
//  Scattered
//
//  Created by zqn on 16-3-24.
//  Copyright (c) 2016年 zqn. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
-(void)addImagesFramFolderURL:(NSURL *)url;
-(NSImage *)thumbImageFromImage:(NSImage *)image;
-(void)presentImage:(NSImage *)image;
-(void)setText:(NSString *)text;
//@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

-(instancetype)init
{
    self = [super init];
    if (self) {
        processingQueue = [[NSOperationQueue alloc] init];
        [processingQueue setMaxConcurrentOperationCount:4];
    }
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    srandom((unsigned)time(NULL));
    
    view.layer = [CALayer layer];
    [view setWantsLayer:YES];
    
    CALayer *textContaint = [CALayer layer];
    textContaint.anchorPoint = CGPointZero;
    textContaint.position = CGPointMake(10, 10);
    textContaint.zPosition = 100;
    textContaint.backgroundColor = CGColorGetConstantColor(kCGColorBlack);
    textContaint.borderColor = CGColorGetConstantColor(kCGColorWhite);
    textContaint.borderWidth = 2;
    textContaint.cornerRadius = 15;
    textContaint.shadowOpacity = 0.5f;
    [view.layer addSublayer:textContaint];
    
    textLayer = [CATextLayer layer];
    textLayer.anchorPoint = CGPointZero;
    textLayer.position = CGPointMake(10, 6);
    textLayer.zPosition = 100;
    textLayer.fontSize = 24;
    textLayer.foregroundColor = CGColorGetConstantColor(kCGColorWhite);
    [textContaint addSublayer:textLayer];
    
    [self setText:@"Loading"];
    
    [self addImagesFramFolderURL:[NSURL fileURLWithPath:@"/Library/Desktop Pictures"]];
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

-(void)setText:(NSString *)text
{
    NSFont *font = [NSFont systemFontOfSize:textLayer.fontSize];
    NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];
    NSSize size = [text sizeWithAttributes:attrs];
    
    size.width = ceilf(size.width);
    size.height = ceilf(size.height);
    textLayer.bounds = CGRectMake(0, 0, size.width, size.height);
    textLayer.superlayer.bounds = CGRectMake(0, 0, size.width+16, size.height+20);
    textLayer.string = text;
}

-(NSImage *)thumbImageFromImage:(NSImage *)image
{
    const CGFloat targetHeight = 200.0f;
    NSSize imageSize = [image size];
    NSSize smallerSize = NSMakeSize(targetHeight * imageSize.width / imageSize.height, targetHeight);
    
    NSImage *smallerImage = [[NSImage alloc] initWithSize:smallerSize];
    
    [smallerImage lockFocus];
    [image drawInRect:NSMakeRect(0, 0, smallerSize.width, smallerSize.height)
             fromRect:NSZeroRect
            operation:NSCompositeCopy
             fraction:1.0];
    [smallerImage unlockFocus];
    return smallerImage;
}
-(void)addImagesFramFolderURL:(NSURL *)folderURL
{
    [processingQueue addOperationWithBlock:^{
        NSTimeInterval t0 = [NSDate timeIntervalSinceReferenceDate];
        
        NSFileManager *fileManager = [NSFileManager new];
        NSDirectoryEnumerator *dirEnum = [fileManager enumeratorAtURL:folderURL
                                           includingPropertiesForKeys:nil
                                                              options:NSDirectoryEnumerationSkipsHiddenFiles
                                                         errorHandler:nil];
        
        //    int allowedFiles = 10;
        
        for (NSURL *url in dirEnum) {
            NSNumber *isDirectory = nil;
            [url getResourceValue:&isDirectory
                           forKey:NSURLIsDirectoryKey
                            error:nil];
            if ([isDirectory boolValue]) {
                continue;
            }
            
            [processingQueue addOperationWithBlock:^{
                NSImage *image = [[NSImage alloc] initWithContentsOfURL:url];
                if (!image) {
                    return;
                }
                
                //        allowedFiles--;
                //        if (allowedFiles<0) {
                //            break;
                //        }
                
                NSImage *thumbImage = [self thumbImageFromImage:image];
                
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    [self presentImage:thumbImage];
                    [self setText:[NSString stringWithFormat:@"%0.1fs", [NSDate timeIntervalSinceReferenceDate]-t0]];
                }];
            }];
        }
    }];
}
-(void)presentImage:(NSImage *)image
{
    CGRect superlayerBounds = view.layer.bounds;
    NSPoint center = NSMakePoint(CGRectGetMidX(superlayerBounds), CGRectGetMidY(superlayerBounds));
    
    NSRect imageBounds = NSMakeRect(0, 0, image.size.width, image.size.height);
    CGPoint randomPoint = CGPointMake(CGRectGetMaxX(superlayerBounds)*(double)random()/(double)RAND_MAX, CGRectGetMaxY(superlayerBounds)*(double)random()/(double)RAND_MAX);
    
    CAMediaTimingFunction *tf = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CABasicAnimation *posAnim = [CABasicAnimation animation];
    posAnim.fromValue = [NSValue valueWithPoint:center];
    posAnim.duration = 1.5;
    posAnim.timingFunction = tf;
    
    CABasicAnimation *bdsAnim = [CABasicAnimation animation];
    bdsAnim.fromValue = [NSValue valueWithRect:NSZeroRect];
    bdsAnim.duration = 1.5;
    bdsAnim.timingFunction = tf;
    
    CALayer *layer = [CALayer layer];
    layer.contents = image;
    layer.actions = [NSDictionary dictionaryWithObjectsAndKeys:posAnim,@"position",bdsAnim,@"bounds",nil];
    
    [CATransaction begin];
    [view.layer addSublayer:layer];
    layer.position = randomPoint;
    layer.bounds = NSRectToCGRect(imageBounds);
    [CATransaction commit];
}

@end
