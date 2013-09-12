//
//  AddCourseViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-10.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Course;
@class AdminMethods;

@interface AddCourseViewController : UIViewController
- (IBAction)Back:(id)sender;
- (IBAction)ClearCourseInfo:(id)sender;
- (IBAction)CleareReadingInfo:(id)sender;
- (IBAction)SaveCourse:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *CourseName;
@property (weak, nonatomic) IBOutlet UITextView *CourseInformation;
@property (weak, nonatomic) IBOutlet UITextView *ReadingInformation;
@property (strong,nonatomic) Course *courseToAdd;
@property (strong,nonatomic) NSMutableArray *courseArray;

-(NSString *) dataFilePath;
-(void) writePlist;
-(void) readPlist;

@end
