//
//  DetailViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-20.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Student;
@interface DetailViewController : UIViewController
- (IBAction)Back:(id)sender;

@property (weak, nonatomic) IBOutlet UITextView *DetailViewText;
@property (weak, nonatomic) Student *currentStudent;

@end
