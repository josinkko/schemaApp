//
//  MainViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-24.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "MainViewController.h"
#import "ViewStudentsViewController.h"
#import "ViewCoursesViewController.h"
#import "MessageStudentViewController.h"
#import "StudentFirstViewController.h"
#import "StudentViewMessagesViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController

@synthesize tabBarController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        tabBarController = [[UITabBarController alloc] init];
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

- (IBAction)launchButton:(id)sender {
    
    
    
    //UITabBarController *tabtab = [[UITabBarController alloc]init];
    MessageStudentViewController *mvs = [MessageStudentViewController new];
    ViewCoursesViewController *vcvc = [ViewCoursesViewController new];
    ViewStudentsViewController *vsvc = [ViewStudentsViewController new];
    NSArray *tabbarViewControllers = [[NSArray alloc]initWithObjects:mvs,vcvc,vsvc, nil];
    
    [self.tabBarController setViewControllers:tabbarViewControllers];
    [self.navigationController pushViewController:self.tabBarController animated:YES];
    
    [mvs setTitle:@"Message"];
    [vcvc setTitle:@"Courses"];
    [vsvc setTitle:@"Students"];
    
}

- (IBAction)launchStudent:(id)sender {
    
    
    
    
    StudentFirstViewController *sfvc = [[StudentFirstViewController alloc] init];
    StudentViewMessagesViewController *svmvc = [[StudentViewMessagesViewController alloc] init];
    
    //UITabBarController *tabBarControllerpruttprutt = [[UITabBarController alloc] init];
    NSArray *viewControllers = [NSArray arrayWithObjects:sfvc, svmvc, nil];
    [self.tabBarController setViewControllers:nil];
    
    [self.tabBarController setViewControllers:viewControllers];
    //[self.navigationController pushViewController:tabBarController animated:YES];
    
    [sfvc setTitle:@"Lessons"];
    [svmvc setTitle:@"Messages"];

    
    
    
}

@end
