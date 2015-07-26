//
//  BNRQuizViewController.h
//  Quiz
//
//  Created by zqn on 15/7/20.
//  Copyright (c) 2015年 my.company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNRQuizViewController : UIViewController
@property (nonatomic) int currentQuestionIndex;

@property (nonatomic,copy) NSArray *question;
@property (nonatomic,copy) NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;
@end
