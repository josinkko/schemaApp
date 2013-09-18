//
//  AddCourseViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-10.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddCourseViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>


- (IBAction)Back:(id)sender;
- (IBAction)ClearCourseInfo:(id)sender;
- (IBAction)CleareReadingInfo:(id)sender;
- (IBAction)SaveCourse:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *CourseName;
@property (weak, nonatomic) IBOutlet UITextView *CourseInformation;
@property (weak, nonatomic) IBOutlet UITextView *ReadingInformation;


@property (strong, nonatomic) IBOutlet UIPickerView *thePickerView;
@property (strong, nonatomic) IBOutlet UITextField *selectedDay;
@property (strong, nonatomic) IBOutlet UITextField *selecteTime;
@property (weak, nonatomic) IBOutlet UITextField *selectedTimeStop;

@property (strong, nonatomic) NSArray *DayArray;
@property (strong, nonatomic) NSArray *TimeArray;
@property (strong, nonatomic) NSArray *TimeArrayStop;

-(void)setupPicker;
-(void)setupBorders;
@end
