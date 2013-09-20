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
    NSArray *values;
    NSManagedObjectContext *context;
}
@synthesize MessageToAll,WelcomeStudentLabel,LoadingMessegesToAll,SchemTabelView, currentStudent;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        values = @[@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday"];
        context = [Storage sharedStorage].context;
        NSLog(@"\r\r\rLoading Student context %@\r\r\r", context);
    }
    return self;
}
- (void)viewDidLoad
{
    
    [super viewDidLoad];    
    NSLog(@"\r\r\rDid We Get Student context %@\r\r\r", context);
    [Storage readData];
    [self alertViewStart];
    [self ActivityStart];
    self.MessageToAll.text = [self fetchMessages];

    
}
#pragma mark - Message Methods

-(NSString*)fetchMessages
{
    NSMutableString *messagesString = [NSMutableString new];
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    for (SendMessage *mess in delegate.messages) {
        if ([mess.studentId isEqualToString:@"messageToAll"]) {
            [self ActivityStop];

            [messagesString appendString:mess.message];

        }
    }
    return messagesString;
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
            }else{
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please try again, wrong ID"
                                                               message:@""
                                                              delegate:self
                                                     cancelButtonTitle:@"Cancel"
                                                     otherButtonTitles:@"Ok", nil];
                
                alert.alertViewStyle = UIAlertViewStyleSecureTextInput;
                [[alert textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeNumberPad];
                [alert show];
                
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
    return [values count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if(!cell)
    {
        NSLog(@"Creating new cell");
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    }

    NSMutableArray *cellArray = [NSMutableArray new];
    if (indexPath == 0 ) {
        if (currentStudent.courses) {
            for (Course *c in currentStudent.courses) {
                if (c.lesson.mondayStart && c.lesson.mondayStop) {
                    [cellArray addObject:c.lesson.mondayStart];
                    [cellArray addObject:c.lesson.mondayStop];
                }
            }
            cell.textLabel.text = [NSString stringWithFormat:@"%@: %@",values[indexPath.row], cellArray];
        }
    }
//    if värdet är equal to 0
//        set textlabel värdet.
//    if (currentStudent.courses) {
//        for (Course *c in currentStudent.courses) {
//            if (c.lesson.mondayStart && c.lesson.mondayStop) {
//                
//                NSLog(@"\r\r\r\r Monday Start: %@ Stop: %@\r\r\r\r", c.lesson.mondayStart, c.lesson.mondayStop);
//            }
//            if (c.lesson.tuesdayStart && c.lesson.tuesdayStop) {
//                NSLog(@"\r\r\r\r Tuesday Start: %@ Stop: %@\r\r\r\r", c.lesson.tuesdayStart, c.lesson.tuesdayStop);
//            }
//        }
//    }
    
    return cell;
    
    
    /////// göra en custom cell med två label, en som visar första tiden på dagen och en som visar sista.
    // i cellen finns resterande schema.
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DayDetailViewController *ddvc = [DayDetailViewController new];
    ddvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:ddvc animated:YES completion:nil];
    
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
