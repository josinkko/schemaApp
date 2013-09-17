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

@interface StudentViewController () <UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>

@end

@implementation StudentViewController
{
    NSArray *values;
    
}
@synthesize MessageToAll,WelcomeStudentLabel;

- (void)viewDidLoad
{

    
    [super viewDidLoad];
    [self alertViewStart];

    
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
    
    if(buttonIndex ==0)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        WelcomeStudentLabel.text = @"Welcome student";
    }
}




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        values = @[@"Måndag",@"Tisdag",@"Onsdag",@"Torsdag",@"Fredag"];
    }
    return self;
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
    cell.textLabel.text = values[indexPath.row];
    
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


-(void)getStudentAlert
{

}


@end
