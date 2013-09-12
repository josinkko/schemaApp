//
//  UpdateCoursesViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-11.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "UpdateCoursesViewController.h"

@interface UpdateCoursesViewController ()

@end

@implementation UpdateCoursesViewController
@synthesize UpdateCourseInfo,UpdateCourseRead,UpdateCourseName;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UpdateCourseInfo.layer.borderColor = [UIColor lightGrayColor].CGColor;
    UpdateCourseInfo.layer.borderWidth = 0.5f;
    UpdateCourseRead.layer.borderColor = [UIColor lightGrayColor].CGColor;
    UpdateCourseRead.layer.borderWidth = 0.5f;


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)ClearInfo:(id)sender {
    [self textViewDidBeginEditing:UpdateCourseInfo];
}

- (IBAction)ClearRead:(id)sender {
    [self textViewDidBeginEditing:UpdateCourseRead];
}




- (IBAction)SaveUpdate:(id)sender {
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark reload textfield
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    
    textView.text = @"";
}

@end
