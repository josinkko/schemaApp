//
//  AdminViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-09.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "AdminViewController.h"
#import "MessageStudentViewController.h"
#import "MessageAllViewController.h"
#import "AddCourseViewController.h"
#import "DeleteCourseViewController.h"
#import "AddStudentViewController.h"
#import "UpdateStudentViewController.h"
#import "UpdateCoursesViewController.h"
@interface AdminViewController ()

@end

@implementation AdminViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Back:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)AddCourse:(id)sender {
    AddCourseViewController *acvc = [AddCourseViewController new];
    acvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:acvc animated:YES completion:nil];
}

- (IBAction)UpdateSchem:(id)sender {
    UpdateCoursesViewController *ucvc = [UpdateCoursesViewController new];
    ucvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:ucvc animated:YES completion:nil];
}

- (IBAction)DeleteSchem:(id)sender {
    DeleteCourseViewController *dcvc = [DeleteCourseViewController new];
    dcvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:dcvc animated:YES completion:nil];
}

- (IBAction)AddNewStudent:(id)sender {
    AddStudentViewController *asvc = [AddStudentViewController new];
    asvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:asvc animated:YES completion:nil];
}

- (IBAction)UpdateStudent:(id)sender {
    UpdateStudentViewController *usvc = [UpdateStudentViewController new];
    usvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:usvc animated:YES completion:nil];
}



- (IBAction)MessageToAll:(id)sender {
    MessageAllViewController *mavc = [MessageAllViewController new];
    mavc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:mavc animated:YES completion:nil];
}

- (IBAction)MessageToStudent:(id)sender {
    MessageStudentViewController *msvc = [MessageStudentViewController new];
    msvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:msvc animated:YES completion:nil];
}



@end
