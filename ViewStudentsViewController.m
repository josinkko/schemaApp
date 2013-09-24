//
//  ViewStudentsViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-24.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "ViewStudentsViewController.h"
#import "AddStudentViewController.h"
@interface ViewStudentsViewController ()

@end

@implementation ViewStudentsViewController

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

- (IBAction)addNewStudent:(id)sender {
    AddStudentViewController *asvc = [AddStudentViewController new];
    asvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:asvc animated:YES completion:nil];
}
@end
