//
//  TutorController.h
//  TypeTutor
//
//  Created by zqn on 2016/7/28.
//  Copyright © 2016年 my.company. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class BigLetterView;

@interface TutorController : NSObject{
    //outlets
    IBOutlet BigLetterView *inLetterView;
    IBOutlet BigLetterView *outLetterView;
    IBOutlet NSWindow *speedSheet;
    
    //Data
    NSArray *letters;
    int lastIndex;
    
    //Time
    NSTimeInterval startTime;
    NSTimeInterval elapsedTime;
    NSTimeInterval timeLimit;
    NSTimer *timer;
}

- (IBAction)stopGo:(id)sender;
- (IBAction)showSpeedSheet:(id)sender;
- (IBAction)endSpeedSheet:(id)sender;

- (void)updateElapsedTime;
- (void)resetElapsedTime;
- (void)showAnotherLetter;

@end
