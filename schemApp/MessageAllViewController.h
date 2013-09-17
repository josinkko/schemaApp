//
//  MessageAllViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-09.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageAllViewController : UIViewController

- (IBAction)back:(id)sender;
- (IBAction)ClearMessage:(id)sender;
- (IBAction)SendMessage:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *FromTextField;

@property (weak, nonatomic) IBOutlet UITextView *MessageText;

@property (weak, nonatomic) IBOutlet UILabel *MessageSent;
@end
