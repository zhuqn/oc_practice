//
//  PreferenceController.h
//  RaiseMan
//
//  Created by zqn on 15/10/25.
//  Copyright © 2015年 my.company. All rights reserved.
//

#import <Cocoa/Cocoa.h>

extern NSString * const BNRTableBgColorKey;
extern NSString * const BNREmptyDocKey;

@interface PreferenceController : NSWindowController{
    IBOutlet NSColorWell *colorWell;
    IBOutlet NSButton *checkBox;
}
-(IBAction)changeBackgroundColor:(id)sender;
-(IBAction)changeNewEmptyDoc:(id)sender;

+(NSColor*)preferenceTableBgColor;
+(void)setPreferenceTableBgColor:(NSColor *)color;
+(BOOL)preferenceEmptyDoc;
+(void)setPreferenceEmptyDoc:(BOOL)emptyDoc;

@end
