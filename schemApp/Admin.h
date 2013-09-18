//
//  Admin.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-11.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Lesson;
@class AdminMethods;
@interface Admin : NSObject

@property (nonatomic, readonly) NSString *adminId;
@property (nonatomic, copy) NSString *adminName;
@property (nonatomic, copy) NSMutableArray *unreadMessages;
@property (nonatomic, copy) NSMutableArray *readMessages;
@property (nonatomic, strong) AdminMethods *adminMethods;
/*
 Since we do not have Core Data yet we load all courses, students and lessons into containers.
 This is temporary so that Admin gets data to work with.
 */
@property (nonatomic, weak) NSMutableSet *courses;
@property (nonatomic, weak) NSMutableSet *students;
@property (nonatomic, weak) NSMutableSet *lessons;

/*
 Admin shall be able to change only one lesson at a time.
 This is to prevent two Admins to update one lesson at the same time.
 */
@property (nonatomic, weak) Lesson *activeLesson;

-(id)initWithName: (NSString*) targetAdminName;

#pragma mark - Load data to Admin
-(void) loadCourses: (NSMutableSet*) targetCourses students: (NSMutableSet*) targetStudents lessons: (NSMutableSet*) targetLessons;


@end
