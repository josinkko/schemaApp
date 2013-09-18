//
//  DeleteCourseViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-10.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeleteCourseViewController : UIViewController
- (IBAction)Back:(id)sender;
- (IBAction)DeleteYes:(id)sender;
- (IBAction)DeleteNo:(id)sender;

@property (weak, nonatomic) IBOutlet UISearchBar *SearchForCourseDelete;

@property (weak, nonatomic) IBOutlet UILabel *DeleteThisCourse;
@property (weak, nonatomic) IBOutlet UILabel *CourseIsDeleted;

@end
