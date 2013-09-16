//
//  AddCourseViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-10.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "AddCourseViewController.h"
#import "Admin.h"
#import "AdminMethods.h"
#import "Course.h"
#import "Storage.h"
@interface AddCourseViewController () <UITextFieldDelegate>
{
    AdminMethods *adminMethods;
    Storage *storage;
}
@end

@implementation AddCourseViewController
@synthesize courseToAdd;

@synthesize CourseInformation,ReadingInformation,CourseName;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        adminMethods = [AdminMethods new];
        storage = [Storage sharedStorage];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CourseInformation.layer.borderColor = [UIColor lightGrayColor].CGColor;
    CourseInformation.layer.borderWidth = 0.5f;
    ReadingInformation.layer.borderColor = [UIColor lightGrayColor].CGColor;
    ReadingInformation.layer.borderWidth = 0.5f;

    [self readPlist];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)ClearCourseInfo:(id)sender {
    [self textViewDidBeginEditing:CourseInformation];
}

- (IBAction)CleareReadingInfo:(id)sender {
    [self textViewDidBeginEditing:ReadingInformation];
}

#pragma mark - Add Course to Storage
- (IBAction)SaveCourse:(id)sender {
    /*
        Create a course from textfields and add to SharedStorage (storage.courses)
        Save SharedStorage to File.
     */
    [storage.courses addObject:[[Course alloc]initWithCourseName:self.CourseName.text courseDescription:self.CourseInformation.text courseReadingMaterial:self.ReadingInformation.text courseId:self.CourseName.text]];
    [self writePlist];
    
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


#pragma mark plist
-(NSString*) dataFilePath
{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [path objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:@"list.plist"];
}

-(void)writePlist
{
    /*
        returnStorageAsNSArray converts Course to NSDictionary and returns them as NSArray.
     */
    [[storage returnStorageAsNSArray] writeToFile:[self dataFilePath] atomically:YES];
}
-(void) readPlist
{
    NSString * filePath = [self dataFilePath];
    if([[NSFileManager defaultManager]fileExistsAtPath:filePath]){
        storage.courses = [[NSMutableArray alloc]initWithContentsOfFile:filePath];
        NSLog(@"%@",storage.courses);
    }
}

@end
