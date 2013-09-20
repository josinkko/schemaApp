//
//  StudentViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-10.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Student;
@interface StudentViewController : UIViewController
- (IBAction)Back:(id)sender;
- (IBAction)ReadMessage:(id)sender;
- (IBAction)showSchem:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *WelcomeStudentLabel;
@property (weak, nonatomic) IBOutlet UILabel *TodaysLections;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *LoadingMessegesToAll;
@property (weak, nonatomic) IBOutlet UILabel *MessageToAll;
@property (weak, nonatomic) IBOutlet UITableView *SchemTabelView;
@property (strong, nonatomic) Student *currentStudent;
@end
