//
//  AdminViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-09.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdminViewController : UIViewController
- (IBAction)Back:(id)sender;

- (IBAction)AddCourse:(id)sender;
- (IBAction)UpdateSchem:(id)sender;
- (IBAction)DeleteSchem:(id)sender;

- (IBAction)AddNewStudent:(id)sender;
- (IBAction)UpdateStudent:(id)sender;

- (IBAction)MessageToAll:(id)sender;
- (IBAction)MessageToStudent:(id)sender;

@end
