//
//  BNRQuizViewController.m
//  Quiz
//
//  Created by Scott Russell on 6/1/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation BNRQuizViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil
                          bundle:(NSBundle *)nibBundleOrNil
{
    //Call the init method implemented by superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.questions = @[@"From what is cognac made?",
                           @"What is 7+7?",
                           @"What is the capital of Vermont?"];
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
    }
    
    //return the address of the new object
    return self;
}

- (IBAction)showQuestion:(id)sender
{
    //Next Question
    self.currentQuestionIndex++;
    
    //Surpass last question?
    if (self.currentQuestionIndex == [self.questions count]) {
        self.currentQuestionIndex = 0;  //go back
    }
    
    //Get the string at the index in array
    NSString *question = self.questions[self.currentQuestionIndex];
    self.questionLabel.text = question;
    
    //Reset the answer label
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(id)sender
{
    //What is the answer to the current question?
    self.answerLabel.text = self.answers[self.currentQuestionIndex];
}

@end
