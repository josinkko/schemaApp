//
//  AddStudentViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-10.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddStudentViewController : UIViewController <UISearchDisplayDelegate, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>
- (IBAction)Back:(id)sender;
- (IBAction)SaveStudent:(id)sender;
- (IBAction)addCourses:(id)sender;
- (IBAction)cancelAddCourses:(id)sender;

@property (weak, nonatomic) IBOutlet UISearchBar *searchCourse;

@property (weak, nonatomic) IBOutlet UILabel *showLessonsLabel;

@property (weak, nonatomic) IBOutlet UITextField *FirstNameText;
@property (weak, nonatomic) IBOutlet UITextField *LastNameText;
@property (weak, nonatomic) IBOutlet UITextField *IdText;
@end
