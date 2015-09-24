//
//  KvcFunAppDelegate.h
//  KvcFun
//
//  Created by zqn on 15/9/24.
//  Copyright © 2015年 my.company. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface KvcFunAppDelegate : NSObject <NSApplicationDelegate>
{
    int fido;
}

@property (assign,readwrite)int fido;
//- (int)fido;
//- (void)setFido:(int)x;

- (IBAction)incrementFido:(id)sender;

@end

