//
//  MainViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-24.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

- (IBAction)launchButton:(id)sender;
- (IBAction)launchStudent:(id)sender;

@property (nonatomic) UITabBarController *tabBarController;

@end
