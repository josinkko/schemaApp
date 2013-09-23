//
//  DayDetailViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-10.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Student;
@interface DayDetailViewController : UIViewController
- (IBAction)Back:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *TimeTabelView;
@property (weak, nonatomic) Student *currentStudent;
@end
