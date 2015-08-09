//
//  BNRHypnosisController.m
//  HypnoNerd
//
//  Created by zqn on 15/8/9.
//  Copyright (c) 2015年 my.company. All rights reserved.
//

#import "BNRHypnosisController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisController
- (void)loadView
{
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    
    self.view = backgroundView;
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Hypnotize";
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        self.tabBarItem.image=i;
    }
    return self;
}
@end
