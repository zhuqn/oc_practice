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
    BOOL isHighlighted;
}
@property (strong)NSColor *bgColor;
@property (copy)NSString *string;

@end
