//
//  MessageStudentViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-09.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "MessageStudentViewController.h"
#import "Couch.h"
#import "SendMessage.h"
@interface MessageStudentViewController ()  <UITextFieldDelegate, UISearchBarDelegate>

@end

@implementation MessageStudentViewController
@synthesize MessageText,MessageFrom,MessageTo,MessageSent;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [self timeStamp];
    [super viewDidLoad];
    MessageText.layer.borderColor = [UIColor lightGrayColor].CGColor;
    MessageText.layer.borderWidth = 0.5f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)send:(id)sender {
    NSLog(@"***************  SEND MESSEGE  ***************");
    Couch *couch =[[Couch alloc] init];
    SendMessage *message = [[SendMessage alloc]initWithMessage:self.MessageText.text
                                                          From:self.MessageFrom.text StudentId:self.MessageTo.text];{
        [couch reqToUrl:@"https://schempp.iriscouch.com/messages"
             HttpMethod:@"POST" body:[message json] onComplete:^(NSURLResponse *response,
                                                                 NSData *data,
                                                                 NSError *error) {
                 NSLog(@"%@", [Couch parseData:data]);
                 NSLog(@"***************  SUCCESS  ***************");
                 
             }];
        MessageSent.text = @"Message sent";
        
    }
    
}

- (IBAction)Clear:(id)sender {
    [self textViewDidBeginEditing:MessageText];

}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark reload textfield
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    
    textView.text = @"";
    [self timeStamp];
}
-(void)timeStamp
{
#pragma mark Set time stamp on message
    NSDate *currentDateTime = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE, HH:mm"];
    NSString *dateInStringFormated = [dateFormatter stringFromDate:currentDateTime];
    NSLog(@"%@", dateInStringFormated);
    MessageText.text = dateInStringFormated;
}

@end
