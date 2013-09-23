//
//  Storage.h
//  schemApp
//
//  Created by Jimmy Lidström on 2013-09-16.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Course;

@interface Storage : NSObject

@property (nonatomic, readonly, strong)NSManagedObjectContext *context;

+(Storage*) sharedStorage;

+(void) saveManagedContext:(NSManagedObjectContext*) targetContext;

+(void) readData;

- (NSMutableArray *) readCourseWithPredicate: (NSPredicate *) predicate;
- (void) updateCourseWithCourseName: (NSString *) courseName withNewInfo: (Course *) newCourse;
- (void) deleteCourseWithCourseName: (NSString *) courseName;
@end
