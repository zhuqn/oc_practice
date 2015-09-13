//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by zqn on 15/8/9.
//  Copyright (c) 2015年 my.company. All rights reserved.
//

#import "BNRReminderViewController.h"
@interface BNRReminderViewController()
@property (nonatomic,weak) IBOutlet UIDatePicker *datePicker;
@end

@implementation BNRReminderViewController
- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
    
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"HyponNerd me!";
    note.fireDate = date;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIBarButtonItem *tbi = self.tabBarItem;
        tbi.title=@"Reminder";
        
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        tbi.image = i;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"BNRReminderViewController loaded its view");
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}
@end
