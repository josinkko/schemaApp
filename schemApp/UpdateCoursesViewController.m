//
//  UpdateCoursesViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-11.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "UpdateCoursesViewController.h"
#import "Course.h"
#import "Storage.h"

@interface UpdateCoursesViewController ()
{
    NSMutableArray *searchResultsArray;
}
@end

@implementation UpdateCoursesViewController
@synthesize UpdateCourseInfo,UpdateCourseRead,UpdateCourseName;
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
    [super viewDidLoad];
    UpdateCourseInfo.layer.borderColor = [UIColor lightGrayColor].CGColor;
    UpdateCourseInfo.layer.borderWidth = 0.5f;
    UpdateCourseRead.layer.borderColor = [UIColor lightGrayColor].CGColor;
    UpdateCourseRead.layer.borderWidth = 0.5f;
    self.searchCourse.delegate = self;
    self.searchDisplayController.delegate = self;
    self.searchDisplayController.searchResultsDataSource = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)ClearInfo:(id)sender {
    [self textViewDidBeginEditing:UpdateCourseInfo];
}

- (IBAction)ClearRead:(id)sender {
    [self textViewDidBeginEditing:UpdateCourseRead];
}

- (IBAction)SaveUpdate:(id)sender {
    
    
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
}

#pragma mark - Search-functions

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [searchResultsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"Cell";
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
    [[cell textLabel] setText:[[searchResultsArray objectAtIndex:indexPath.row] courseName]];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Course *currentCourse = [searchResultsArray objectAtIndex:indexPath.row];
    NSLog(@"SELECTED ROW: %@", currentCourse.courseName);
    [[self UpdateCourseInfo] setText:currentCourse.courseDescription];
    [[self UpdateCourseName] setText:currentCourse.courseName];
    [[self UpdateCourseRead] setText:currentCourse.courseReadingMaterial];
    [[self searchDisplayController] setActive:NO animated:YES];
}


-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *predicateString = @"courseName == %@";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:predicateString, [searchBar text]];
    searchResultsArray = [[Storage sharedStorage] readCourseWithPredicate:predicate];
    
    [[[self searchDisplayController] searchResultsTableView] reloadData];
}

@end
