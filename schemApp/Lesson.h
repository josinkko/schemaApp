//
//  Lesson.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-11.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Course;

@interface Lesson : NSObject

@property (nonatomic, copy) NSString* lessonId;
@property (nonatomic, copy) NSDate* lessonTimeStart;
@property (nonatomic, copy) NSDate* lessonTimeEnd;
@property (nonatomic, copy) Course* course;
@property (nonatomic, copy) NSString* teacher;
@property (nonatomic, copy) NSMutableSet* students;
@property (nonatomic, copy) NSString* classRoom;
@property (nonatomic, copy) NSString* readingInstructions;


-(id) initWithLessonTimeStart: (NSDate*) targetLessonTimeStart lessonTimeEnd: (NSDate*) targetLessonTimeEnd course: (Course*) targetCourse teacher: (NSString*) targetTeacher students: (NSMutableSet*)targetStudents classRoom: (NSString*) targetClassRoom readingInstructions: (NSString*) targetReadingInstructions;

-(NSString*) returnDateAsString: (NSDate*) targetDate;
-(NSDate*) returnDateFromString: (NSString*) targetString;

-(NSDictionary*)returnLessonAsNSDictionary;
+(id)returnLessonFromDictionary: (NSDictionary*)targetLessonAsNSDictionary;

@end
