//
//  UpdateCoursesViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-11.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpdateCoursesViewController : UIViewController
- (IBAction)Back:(id)sender;
- (IBAction)ClearInfo:(id)sender;
- (IBAction)ClearRead:(id)sender;


- (IBAction)SaveUpdate:(id)sender;

@property (weak, nonatomic) IBOutlet UISearchBar *SearchCourse;

@property (weak, nonatomic) IBOutlet UITextField *UpdateCourseName;
@property (weak, nonatomic) IBOutlet UITextView *UpdateCourseInfo;
@property (weak, nonatomic) IBOutlet UITextView *UpdateCourseRead;



@end
