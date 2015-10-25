//
//  PreferenceController.h
//  RaiseMan
//
//  Created by zqn on 15/10/25.
//  Copyright © 2015年 my.company. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PreferenceController : NSWindowController{
    IBOutlet NSColorWell *colorWell;
    IBOutlet NSButton *checkBox;
}
-(IBAction)changeBackgroundColor:(id)sender;
-(IBAction)changeNewEmptyDoc:(id)sender;

@end
