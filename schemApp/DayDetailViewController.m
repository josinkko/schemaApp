//
//  DayDetailViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-10.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "DayDetailViewController.h"
#import "Student.h"
#import "Course.h"
<<<<<<< HEAD
#import "DetailViewController.h"
=======
>>>>>>> patrikupload
@interface DayDetailViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation DayDetailViewController
{
    NSMutableArray *values;
    
}
@synthesize currentStudent;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"curent student MMMMM%@",currentStudent);
    values = [NSMutableArray new];
    for (Course *course in currentStudent.courses) {
        
        [values addObject:course.courseName];
        NSLog(@"%@",course);
    }
    
}




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    
    }
    return self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%lu",(unsigned long)[values count]);
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
    cell.textLabel.text = [values objectAtIndex:indexPath.row];
    NSLog(@"asasas :%@",values);
    return cell;
    

    /////// göra en custom cell med två label, en som visar första tiden på dagen och en som visar sista.
    // i cellen finns resterande schema.
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController*dvc = [DetailViewController new];
    dvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    dvc.currentStudent = currentStudent;

    [self presentViewController:dvc animated:YES completion:nil];
    
}

- (IBAction)Back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}





@end
