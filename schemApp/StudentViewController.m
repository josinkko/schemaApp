//
//  StudentViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-10.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "StudentViewController.h"
#import "DayDetailViewController.h"
#import "PrivateMessageViewController.h"
#import "Course.h"
#import "Student.h"
#import "Lesson.h"
#import "Storage.h"
#import "SendMessage.h"
#import "AppDelegate.h"

@interface StudentViewController () <UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>
@end
@implementation StudentViewController
{
    NSMutableArray *messages;
    NSManagedObjectContext *context;
}
@synthesize WelcomeStudentLabel,LoadingMessegesToAll,messageTableView, currentStudent;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        context = [Storage sharedStorage].context;
        messages = [NSMutableArray new];
        NSLog(@"\r\r\rLoading Student context %@\r\r\r", context);
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fetchMessageToAll];
    NSLog(@"\r\r\rDid We Get Student context %@\r\r\r", context);
    [Storage readData];
    [self alertViewStart];
    //[self ActivityStart];
}

#pragma mark - Message Methods

-(void)fetchMessageToAll
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    for (SendMessage *message in delegate.messages) {
        if ([message.studentId isEqualToString:@"messageToAll"] || [message.studentId isEqualToString:currentStudent.firstName]) {
            [messages addObject:message];
        }
    }
}


#pragma mark AlertView settings
-(void)alertViewStart
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please enter your ID"
                                                   message:@""
                                                  delegate:self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"Ok", nil];
    
    alert.alertViewStyle = UIAlertViewStyleSecureTextInput;
    [[alert textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeNumberPad];
    [alert show];
}
- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    NSString *inputText = [[alertView textFieldAtIndex:0] text];
    if( [inputText length] == 10 )
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if(buttonIndex == 0)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        NSFetchRequest *studentRequest = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
        NSArray * studentResult = [context executeFetchRequest:studentRequest error:nil];
        for (Student *student in studentResult) {
            if ([student.studentSignum isEqualToString:[[alertView textFieldAtIndex:0] text]]) {
                WelcomeStudentLabel.text = [NSString stringWithFormat:@"Welcome %@ %@", student.firstName, student.lastName];
                currentStudent = student;
                NSLog(@"\r\r\r\r\r\r currentStudent: %@ \r\rstudent:%@\r\r\r\r",currentStudent, student);
                break;
            }
        }
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [messages count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    }

    
        cell.textLabel.text = [[messages objectAtIndex:[indexPath row]] message];
    
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}


- (IBAction)Back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)ReadMessage:(id)sender {
    PrivateMessageViewController *pmvc = [PrivateMessageViewController new];
    pmvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:pmvc animated:YES completion:nil];
}

-(void)ActivityStart
{
    [LoadingMessegesToAll startAnimating];
}
-(void)ActivityStop
{
    [LoadingMessegesToAll stopAnimating];
}

- (IBAction)showSchem:(id)sender {
    
    DayDetailViewController*ddvc = [DayDetailViewController new];
    ddvc.currentStudent = currentStudent;
    NSLog(@"super: %@",currentStudent);
    ddvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:ddvc animated:YES completion:nil];
    
}
@end
