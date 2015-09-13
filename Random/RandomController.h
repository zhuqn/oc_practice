//
//  RandomController.h
//  Random
//
//  Created by zqn on 15/9/8.
//  Copyright (c) 2015年 my.company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface RandomController : NSObject
{
    IBOutlet NSTextField *textField;
}

- (IBAction)seed:(id)sender;
- (IBAction)generate:(id)sender;
@end
