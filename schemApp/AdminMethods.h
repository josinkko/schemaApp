//
//  AdminMethods.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-11.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
@class Student;
@class Course;
@class Lesson;
@interface AdminMethods : NSObject

#pragma mark - Student
-(void) createStudent;
-(void) addStudent;
-(void) removeStudent;
-(void) updateStudent: (Student*) targetStudent;

#pragma mark - Course methods
-(void) createCourse;
-(void) addCourse;
-(void) removeCourse;
-(void) updateCourse: (Course*) targetCourse;

#pragma mark - Lesson methods
-(void) createLesson;
-(void) addLesson;
-(void) removeLesson;
-(void) updateLesson: (Lesson*) targetLesson;

#pragma mark - Message methods
-(void) sendMessage: (NSString*) targetMessage ToSpecificUser: (id<User>) targetUser;
-(void) sendBroadCastMessage: (NSString*) targetMessage;
-(void) readUnreadMessages;
@end