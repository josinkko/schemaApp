//
//  DetailViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-20.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "DetailViewController.h"
#import "Student.h"
#import "Course.h"
@interface DetailViewController ()

@end

@implementation DetailViewController
{
    NSMutableArray *values;
    
}
@synthesize currentStudent,DetailViewText;
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


    values = [NSMutableArray new];
    for (Course *course in currentStudent.courses) {
        
        [values addObject:course.courseName];
        NSLog(@"%@",course);
    }
    DetailViewText.text = [values description];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
