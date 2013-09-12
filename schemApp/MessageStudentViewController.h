//
//  MessageStudentViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-09.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageStudentViewController : UIViewController <UITextFieldDelegate>

- (IBAction)Back:(id)sender;
@property (weak, nonatomic) IBOutlet UISearchBar *Search;
@property (weak, nonatomic) IBOutlet UITextView *MessageText;


- (IBAction)send:(id)sender;
- (IBAction)Clear:(id)sender;


@end
