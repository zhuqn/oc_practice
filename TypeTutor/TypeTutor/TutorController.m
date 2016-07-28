//
//  TutorController.m
//  TypeTutor
//
//  Created by zqn on 2016/7/28.
//  Copyright © 2016年 my.company. All rights reserved.
//

#import "TutorController.h"
#import "BigLetterView.h"

@implementation TutorController

-(instancetype)init{
    self = [super init];
    if (self) {
        letters =[NSArray arrayWithObjects:@"a",@"s",@"d",@"f",@"j",@"k",@"I",@";", nil];
        
        srandom((unsigned)time(NULL));
        timeLimit=5.0;
    }
    return self;
}

-(void)awakeFromNib{
    [self showAnotherLetter];
}

- (void)resetElapsedTime{
    startTime = [NSDate timeIntervalSinceReferenceDate];
    [self updateElapsedTime];
}

-(void)updateElapsedTime{
    [self willChangeValueForKey:@"elapsedTime"];
    elapsedTime = [NSDate timeIntervalSinceReferenceDate] - startTime;
    [self didChangeValueForKey:@"elapsedTime"];
}

-(void)showAnotherLetter{
    //选择随机数，知道一个不同的值
    int x = lastIndex;
    while (x == lastIndex) {
        x = (int)(random()%[letters count]);
    }
    lastIndex = x;
    [outLetterView setString:[letters objectAtIndex:x]];
    
    //再次计数
    [self resetElapsedTime];
}

- (IBAction)stopGo:(id)sender{
    [self resetElapsedTime];
    if (timer==nil) {
        NSLog(@"Starting");
        
        //创建定时器
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                target:self
                                              selector:@selector(checkThem:)
                                              userInfo:nil
                                               repeats:YES];
    }
    else{
        NSLog(@"Stopping");
        
        //置定时器无效
        [timer invalidate];
        timer = nil;
    }
}

- (IBAction)showSpeedSheet:(id)sender{
    [NSApp beginSheet:speedSheet
       modalForWindow:[inLetterView window]
        modalDelegate:nil
       didEndSelector:NULL
          contextInfo:NULL];
}

- (IBAction)endSpeedSheet:(id)sender{
    //返回事件句柄
    [NSApp endSheet:speedSheet];
    
    //隐藏sheet
    [speedSheet orderOut:sender];
}

- (void)checkThem:(NSTimer *)aTimer{
    if ([[inLetterView string] isEqualToString:[outLetterView string]]) {
        [self showAnotherLetter];
    }
    [self updateElapsedTime];
    if (elapsedTime >= timeLimit) {
        NSBeep();
        [self resetElapsedTime];
    }
}

@end
