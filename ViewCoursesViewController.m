//
//  ViewCoursesViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-24.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "ViewCoursesViewController.h"
#import "AddCourseViewController.h"
@interface ViewCoursesViewController ()

@end

@implementation ViewCoursesViewController

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

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)addNewCourse:(id)sender {
    AddCourseViewController *acvc = [AddCourseViewController new];
    acvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:acvc animated:YES completion:nil];
}
@end
