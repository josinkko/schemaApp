//
//  MessageAllViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-09.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "MessageAllViewController.h"
#import "SendMessage.h"
#import "Couch.h"
@interface MessageAllViewController () <UITextFieldDelegate>

@end
@implementation MessageAllViewController
@synthesize MessageText,FromTextField,MessageSent;
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





- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)ClearMessage:(id)sender {
    [self textViewDidBeginEditing:MessageText];
    
}
#pragma mark MessageToAll
- (IBAction)SendMessage:(id)sender {
    NSLog(@"***************  SEND MESSEGE  ***************");
    Couch *couch =[[Couch alloc] init];
    SendMessage *message = [[SendMessage alloc]initWithMessage:self.MessageText.text
                                                        From:self.FromTextField.text StudentId:@"messageToAll"];{
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
