//
//  BNRQuizViewController.m
//  Quiz
//
//  Created by zqn on 15/7/20.
//  Copyright (c) 2015年 my.company. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()

@end

@implementation BNRQuizViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.question = @[@"From what is cognac made?",
                          @"What is 7+7",
                          @"What is the capital of Vermont?"];
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
    }
    return self;
}

- (IBAction)showQuestion:(id)sender
{
    self.currentQuestionIndex++;
    if (self.currentQuestionIndex == [self.question count]) {
        self.currentQuestionIndex=0;
    }
    NSString *question = self.question[self.currentQuestionIndex];
    self.questionLabel.text=question;
    self.answerLabel.text=@"???";
}
- (IBAction)showAnswer:(id)sender
{
    NSString *answer=self.answers[self.currentQuestionIndex];
    self.answerLabel.text=answer;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
