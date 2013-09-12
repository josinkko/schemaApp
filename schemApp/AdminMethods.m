//
//  AdminMethods.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-11.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "AdminMethods.h"
#import "Student.h"
@implementation AdminMethods

#pragma mark - Student
-(void) createStudent
{
    //Code...
}
-(void) addStudent
{
    //Code...
}
-(void) removeStudent
{
    //Code...
}
-(void) updateStudent: (Student*) targetStudent
{
    //Code...
}

#pragma mark - Course methods
-(void) createCourse
{
    //Code...
}
-(void) addCourse
{
    //Code...
}
-(void) removeCourse
{
    //Code...
}
-(void) updateCourse: (Course*) targetCourse
{
    //Code...
}

#pragma mark - Lesson methods
-(void) createLesson
{
    //Code...
}
-(void) addLesson
{
    //Code...
}
-(void) removeLesson
{
    //Code...
}
-(void) updateLesson: (Lesson*) targetLesson
{
    //Code...
}

#pragma mark - Message methods
-(void) sendMessage: (NSString*) targetMessage ToSpecificUser: (id<User>) targetUser
{
    //Code...
}
-(void) sendBroadCastMessage: (NSString*) targetMessage
{
    //Code...
}
-(void) readUnreadMessages
{
    //Code...
}

@end

