//
//  UpdateCoursesViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-11.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpdateCoursesViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UISearchDisplayDelegate, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>

- (IBAction)Back:(id)sender;
- (IBAction)ClearInfo:(id)sender;
- (IBAction)ClearRead:(id)sender;


- (IBAction)SaveUpdate:(id)sender;

@property (weak, nonatomic) IBOutlet UISearchBar *searchCourse;

@property (weak, nonatomic) IBOutlet UITextField *UpdateCourseName;
@property (weak, nonatomic) IBOutlet UITextView *UpdateCourseInfo;
@property (weak, nonatomic) IBOutlet UITextView *UpdateCourseRead;



@property (strong, nonatomic) IBOutlet UIPickerView *thePickerView;
@property (strong, nonatomic) IBOutlet UITextField *selectedDay;
@property (strong, nonatomic) IBOutlet UITextField *selecteTime;
@property (weak, nonatomic) IBOutlet UITextField *selectedTimeStop;

@property (strong, nonatomic) NSArray *DayArray;
@property (strong, nonatomic) NSArray *TimeArray;
@property (strong, nonatomic) NSArray *TimeArrayStop;

-(void)setupBorders;


@end
