//
//  BigLetterView.h
//  TypeTutor
//
//  Created by zqn on 16/7/18.
//  Copyright © 2016年 my.company. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BigLetterView : NSView{
    NSColor *bgColor;
    NSString *string;
    
    BOOL bold;
    BOOL italic;
    
    BOOL isHighlighted;
    NSMutableDictionary *attributes;
    NSShadow *shadow;
    
    NSEvent *mouseDownEvent;
    BOOL highlighted;
}
@property (strong)NSColor *bgColor;
@property (copy)NSString *string;

- (void)prepareAttributes;

-(IBAction)cut:(id)sender;
-(IBAction)copy:(id)sender;
-(IBAction)paste:(id)sender;

@end
