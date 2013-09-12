//
//  MainViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-09.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "MainViewController.h"
#import "AdminViewController.h"
#import "StudentViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

@synthesize courses,students;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

     
    
    }
    return self;
}

- (void)viewDidLoad
{
    
    NSDate *currentDateTime = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE, HH:mm"];
    NSString *dateInStringFormated = [dateFormatter stringFromDate:currentDateTime];
    NSLog(@"%@", dateInStringFormated);
    Datelabel.text = dateInStringFormated;
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)AdminButton:(id)sender {
    AdminViewController *avc = [AdminViewController new];
    avc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:avc animated:YES completion:nil];
}

- (IBAction)StudentButton:(id)sender {
    StudentViewController *svc = [StudentViewController new];
    svc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:svc animated:YES completion:nil];
}


@end
