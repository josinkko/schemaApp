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
@synthesize selectedDay,
selecteTime,
selectedTimeStop,
DayArray,
TimeArray,
TimeArrayStop,
thePickerView,
UpdateCourseInfo,
UpdateCourseRead,
UpdateCourseName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupBorders];
    [self setupPicker];


}



#pragma mark PickerController settings
-(void)setupPicker
{
    thePickerView.showsSelectionIndicator = TRUE;
    self.DayArray=[[NSArray alloc] initWithObjects:@"Monday",@"Thursday",@"Wednesday",@"Thursday",@"Friday" ,nil];
    self.TimeArray=[[NSArray alloc] initWithObjects:@"08:00",@"08:10",@"08:20",@"08:30",@"08:40",@"08:50",@"09:00",@"09:10",@"09:20",@"09:30",@"09:40",@"09:50",@"10:00",@"10:10",@"10:20",@"10:30",@"10:40",@"10:50",@"11:00",@"11:10",@"11:20",@"11:30",@"11:40",@"11:50",@"12:00",@"12:10",@"12:20",@"12:30",@"12:40",@"12:50",@"13:00",@"13:10",@"13:20",@"13:30",@"13:40",@"13:50",@"14:00",@"14:10",@"14:20",@"14:30",@"14:40",@"14:50",@"15:00",@"15:10",@"15:20",@"15:30",@"15:40",@"15:50",@"16:00",@"16:10",@"16:20",@"16:30",@"16:40",@"16:50",@"17:00",nil];
    self.TimeArrayStop=[[NSArray alloc] initWithObjects:@"08:00",@"08:10",@"08:20",@"08:30",@"08:40",@"08:50",@"09:00",@"09:10",@"09:20",@"09:30",@"09:40",@"09:50",@"10:00",@"10:10",@"10:20",@"10:30",@"10:40",@"10:50",@"11:00",@"11:10",@"11:20",@"11:30",@"11:40",@"11:50",@"12:00",@"12:10",@"12:20",@"12:30",@"12:40",@"12:50",@"13:00",@"13:10",@"13:20",@"13:30",@"13:40",@"13:50",@"14:00",@"14:10",@"14:20",@"14:30",@"14:40",@"14:50",@"15:00",@"15:10",@"15:20",@"15:30",@"15:40",@"15:50",@"16:00",@"16:10",@"16:20",@"16:30",@"16:40",@"16:50",@"17:00",nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    switch(component ) {
        case 0:
            return [DayArray count];
            break;
        case 1:
            return [TimeArray count];
            break;
        default:
        case 2:
            return [TimeArrayStop count];
            break;
    }
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    
    if (component == 0) {
        return [DayArray objectAtIndex:row];
        
    }
    
    return [TimeArray objectAtIndex:row];
    return [TimeArrayStop objectAtIndex:row];
    
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        self.selectedDay.text=[DayArray objectAtIndex:row];
        return;
    }
    if(component == 1)
    {
        self.selecteTime.text =[TimeArray objectAtIndex:row];
        return;
    }
    self.selectedTimeStop.text = [TimeArrayStop objectAtIndex:row];
}




- (IBAction)Back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}





- (IBAction)SaveUpdate:(id)sender {
}

#pragma mark - UI helpers

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


- (IBAction)ClearInfo:(id)sender {
    [self textViewDidBeginEditing:UpdateCourseInfo];
}

- (IBAction)ClearRead:(id)sender {
    [self textViewDidBeginEditing:UpdateCourseRead];
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    /*
     reload text field
     */
    textView.text = @"";
}


-(void)setupBorders
{
    UpdateCourseInfo.layer.borderColor = [UIColor lightGrayColor].CGColor;
    UpdateCourseInfo.layer.borderWidth = 0.5f;
    UpdateCourseRead.layer.borderColor = [UIColor lightGrayColor].CGColor;
    UpdateCourseRead.layer.borderWidth = 0.5f;
}

@end
