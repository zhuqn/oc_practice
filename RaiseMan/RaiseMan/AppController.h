//
//  AppController.h
//  RaiseMan
//
//  Created by zqn on 15/10/25.
//  Copyright © 2015年 my.company. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PreferenceController;
@class AboutController;

@interface AppController : NSObject{
    PreferenceController *preferenceController;
    AboutController *aboutController;
}
-(IBAction)showPreferencePanel:(id)sender;
-(IBAction)showAboutPanel:(id)sender;

@end
