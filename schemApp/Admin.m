//
//  Admin.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-11.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "Admin.h"
#import "AdminMethods.h"
#import "Lesson.h"
#import "Student.h"

@implementation Admin

@synthesize adminId, adminName, courses, students, lessons, unreadMessages, readMessages,adminMethods;

#pragma mark - init methods

-(id)init
{
    return [self initWithName:@"Need A Name"];
}

-(id)initWithName: (NSString*) targetAdminName
{
    self = [super init];
    if (self) {
        self->adminId = [[NSUUID UUID] UUIDString];
        adminName = targetAdminName;
        unreadMessages = [[NSMutableArray alloc]init];
        readMessages = [[NSMutableArray alloc]init];
        adminMethods = [AdminMethods new];
    }
    return self;
}


#pragma mark - Load data to Admin
-(void) loadCourses: (NSMutableSet*) targetCourses students: (NSMutableSet*) targetStudents lessons: (NSMutableSet*) targetLessons
{
    /*
     This is a helper function since we do not have Core Data.
     For Admin to get access to courses, students and lessons we add them in Admin containers.
     */
    if (targetCourses) {
        for (Course *course in targetCourses) {
            [self.courses addObject:course];
        }
    }
    if (targetStudents) {
        for (Student *student in targetStudents) {
            [self.students addObject:student];
        }
    }
    if (targetLessons) {
        for (Lesson *lesson in targetLessons) {
            [self.lessons addObject:lesson];
        }
    }
}


@end
