//
//  UpdateStudentViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-10.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpdateStudentViewController : UIViewController
- (IBAction)Back:(id)sender;
- (IBAction)Save:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *UpdateFirstName;
@property (weak, nonatomic) IBOutlet UITextField *UpdateLastName;
@property (weak, nonatomic) IBOutlet UITextField *UpdateIdText;
@end
