//
//  AddCourseViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-10.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "AddCourseViewController.h"
#import "Course.h"
#import "Storage.h"
@interface AddCourseViewController () <UITextFieldDelegate>
{
    NSManagedObjectContext *context;
}
@end

@implementation AddCourseViewController
@synthesize selectedDay,
selecteTime,
selectedTimeStop,
DayArray,
TimeArray,
TimeArrayStop,
thePickerView;

@synthesize CourseInformation,ReadingInformation,CourseName;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        /*
         Load Shared CoreData Storage context.
         */
        context = [Storage sharedStorage].context;
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
    self.DayArray=[[NSArray alloc] initWithObjects:@"Måndag",@"Tisdag",@"Onsdag",@"Torsdag",@"Fredag" ,nil];
    self.TimeArray=[[NSArray alloc] initWithObjects:@"08:00",@"09:00",@"10:00",@"11:00", nil];
    self.TimeArrayStop=[[NSArray alloc] initWithObjects:@"08:00",@"09:00",@"10:00",@"11:00", nil];
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

#pragma mark - Add Course to Storage
- (IBAction)SaveCourse:(id)sender {
    /*
     Get Course from Shared CoreData Storage context.
     */
    Course *course = [NSEntityDescription insertNewObjectForEntityForName:@"Course" inManagedObjectContext:context];
    
    course.courseName = self.CourseName.text;
    course.courseId = self.CourseName.text;
    course.courseDescription = self.CourseInformation.text;
    course.courseReadingMaterial = self.ReadingInformation.text;
    course.courseDay = self.selectedDay.text;
    course.courseStart = self.selecteTime.text;
    course.courseStop = self.selectedTimeStop.text;
    
    [Storage saveManagedContext:context];
    [Storage readData];
    
}

#pragma mark - UI helpers

- (IBAction)Back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)ClearCourseInfo:(id)sender {
    [self textViewDidBeginEditing:CourseInformation];
}

- (IBAction)CleareReadingInfo:(id)sender {
    [self textViewDidBeginEditing:ReadingInformation];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(void)setupBorders
{
    CourseInformation.layer.borderColor = [UIColor lightGrayColor].CGColor;
    CourseInformation.layer.borderWidth = 0.5f;
    ReadingInformation.layer.borderColor = [UIColor lightGrayColor].CGColor;
    ReadingInformation.layer.borderWidth = 0.5f;
}

#pragma mark reload textfield
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    
    textView.text = @"";
}






@end
