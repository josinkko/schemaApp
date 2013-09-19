//
//  AddStudentViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-10.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "AddStudentViewController.h"
#import "Storage.h"
#import "Student.h"
#import "Course.h"

@interface AddStudentViewController ()
{
    NSManagedObjectContext *context;
    
    NSMutableArray *searchResultsArray;
    
    
}
@end

@implementation AddStudentViewController
@synthesize searchCourse;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        context = [Storage sharedStorage].context;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.searchCourse.delegate = self;
    self.searchDisplayController.delegate = self;
    self.searchDisplayController.searchResultsDataSource = self;
    self.searchCourse.hidden = YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)SaveStudent:(id)sender
{
    Student *student = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:context];
    student.firstName = self.FirstNameText.text;
    student.lastName = self.LastNameText.text;
    student.studentSignum = self.IdText.text;

    student.isActive = [NSNumber numberWithBool:YES];
    
    [Storage saveManagedContext:context];
    [Storage readData];
}

- (IBAction)addCourses:(id)sender {

    
    [UIView transitionWithView:searchCourse
                      duration:0.6
                       options: UIViewAnimationOptionTransitionCurlDown
                    animations:NULL
                    completion:NULL];
    
    self.searchCourse.hidden = NO;
    
}

- (IBAction)cancelAddCourses:(id)sender {
    [UIView transitionWithView:searchCourse
                      duration:0.6
                       options: UIViewAnimationOptionTransitionCurlUp
                    animations:NULL
                    completion:NULL];
    
    self.searchCourse.hidden = YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
    [[self showLessonsLabel] setText:currentCourse.courseName];
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
