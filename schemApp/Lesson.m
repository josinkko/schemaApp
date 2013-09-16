//
//  Lesson.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-11.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "Lesson.h"
#import "Course.h"
#import "Student.h"
@implementation Lesson
@synthesize lessonId, lessonTimeStart, lessonTimeEnd, course, teacher, students, classRoom, readingInstructions;

#pragma mark - Lesson init methods
/*
 These Init methods will not be needed when we use Core Data!
 We will need to update these two methods.
 */
- (id)init
{
    NSDate *initStartTime = [[NSDate alloc]init];
    NSDate *initEndTime = [[NSDate alloc]init];
    Course *initCourse = [Course new];
    NSString *initTeachers = @"initTeacher";
    NSMutableSet *initStudents = [[NSMutableSet alloc]init];
    NSString *initClassRoom = @"intiClassRoom";
    
    return [self initWithLessonTimeStart:initStartTime lessonTimeEnd:initEndTime course:initCourse teacher:initTeachers students:initStudents classRoom:initClassRoom readingInstructions: @"Reading instructions"];
}

-(id) initWithLessonTimeStart: (NSDate*) targetLessonTimeStart lessonTimeEnd: (NSDate*) targetLessonTimeEnd course: (Course*) targetCourse teacher: (NSString*) targetTeacher students: (NSMutableSet*)targetStudents classRoom: (NSString*) targetClassRoom readingInstructions: (NSString*) targetReadingInstructions
{
    self = [super init];
    if (self) {
        self-> lessonId = [[NSUUID UUID] UUIDString];
        lessonTimeStart = targetLessonTimeStart;
        lessonTimeEnd = targetLessonTimeEnd;
        course = targetCourse;
        teacher = targetTeacher;
        students = targetStudents;
        classRoom = targetClassRoom;
        readingInstructions = targetReadingInstructions;
    }
    return self;
}


#pragma mark - Return methods

-(NSString*) returnDateAsString: (NSDate*) targetDate
{
    /*
     We need this method to convert NSDate in lessonTimeStart/lessonTimeEnd
     to a JSON string when saving data.
     OBS! This might be an excessive function if Core Data automatically converts NSDates.
     
     NSDateFormatter is used to convert NSDate to a string with format "1990-12-30 24:00:00 0000",
     Where the last 0000 is timeZone.
     */
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss z"];
    NSString *stringFromDate = [dateFormatter stringFromDate:targetDate];
    
    return stringFromDate;
}

-(NSDate*) returnDateFromString: (NSString*) targetString
{
    /*
     We need this method to create NSDate in lessonTimeStart/lessonTimeEnd
     from a JSON strings when loading data.
     OBS! This might be an excessive function if Core Data automatically converts NSDates.
     
     NSDateFormatter is used to convert a NSString to an NSDate with format "1990-12-30 24:00:00 0000",
     Where the last 0000 is timeZone.
     */
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss z"];
    NSDate *dateFromString = [dateFormatter dateFromString:targetString];
    
    return dateFromString;
}
-(NSDictionary*)returnLessonAsNSDictionary
{
    /*
     This method converts all the Lesson properties to a NSMutableDictionary.
     We need this method to save lesson as data.
     The entire dictionary will look like this:
     {
     lessonId: lessonValue,
     lessonTimeStart: lessonTimeStartValue,
     lessonTimeEnd: lessonTimeEndValue,
     Course: {
     courseId: courseIdValue
     courseName: courseNameValue
     courseDescription: courseDescriptionValue
     },
     Teacher: teacherValue,
     Student: [
     {
     studentSignum: studentSignumValue,
     firstName: firstNameValue,
     lastName: lastNameValue,
     unreadMessages: unreadMessagesValue,
     readMessages: readMessagesValue
     },
     {
     studentSignum: studentSignumValue,
     firstName: firstNameValue,
     lastName: lastNameValue,
     unreadMessages: unreadMessagesValue,
     readMessages: readMessagesValue
     },
     etc... for all students
     ],
     ClassRoom: classRoomValue,
     readingInstructions: readingInstructionsValue
     }
     */
    
    NSMutableDictionary *lessonAsDictionary = [[NSMutableDictionary alloc]init];
    
    [lessonAsDictionary setValue:self.lessonId forKey:@"lessonId"];
    [lessonAsDictionary setValue:[self returnDateAsString: self.lessonTimeStart] forKey:@"lessonTimeStart"];
    [lessonAsDictionary setValue:[self returnDateAsString: self.lessonTimeEnd] forKey:@"lessonTimeEnd"];
    [lessonAsDictionary setValue:[self.course returnCourseAsNSDictionary] forKey:@"Course"];
    [lessonAsDictionary setValue:self.teacher forKey:@"Teacher"];
    
    NSMutableArray *studentArray = [[NSMutableArray alloc]init];
    for (Student *student in [self.students allObjects]) {
        [studentArray addObject:[student returnStudentAsNSDictionary]];
    }
    [lessonAsDictionary setValue:studentArray forKey:@"Students"];
    
    [lessonAsDictionary setValue:self.classRoom forKey:@"ClassRoom"];
    [lessonAsDictionary setValue:self.readingInstructions forKey:@"readingInstructions"];
    return lessonAsDictionary;
}

+(id)returnLessonFromDictionary: (NSDictionary*)targetLessonAsNSDictionary
{
    Lesson *lesson = [[Lesson alloc]init];
    lesson.lessonId = targetLessonAsNSDictionary[@"lessonId"];
    lesson.lessonTimeStart = [lesson returnDateFromString:targetLessonAsNSDictionary[@"lessonTimeStart"]];
    lesson.lessonTimeEnd = [lesson returnDateFromString:targetLessonAsNSDictionary[@"lessonTimeEnd"]];
    lesson.course = [Course returnCourseFromDictionary:targetLessonAsNSDictionary[@"Course"]];
    lesson.teacher = targetLessonAsNSDictionary[@"Teacher"];
    
    for (NSMutableDictionary *studentAsDict in targetLessonAsNSDictionary[@"Students"]) {
        Student *studentFromDict = [Student returnStudentFromDictionary:studentAsDict];
        [lesson.students addObject:studentFromDict];
    }
    lesson.classRoom = targetLessonAsNSDictionary[@"ClassRoom"];
    lesson.readingInstructions = targetLessonAsNSDictionary[@"readingInstructions"];
    return lesson;
}

#pragma mark - NSSet verification if Lesson objects are equal

-(NSUInteger)hash
{
    return 37 * [self.lessonId hash];
}

-(BOOL)isEqual:(id)object
{
    if (self == object)
    {
        return YES;
    } else if (object && [object isMemberOfClass:[self class]])
    {
        return [self.lessonId isEqualToString:[object lessonId]];
    } else
    {
        return NO;
    }
}

#pragma mark - Lesson object Description for NSLog

-(NSString *)description
{
    return [NSString stringWithFormat:@"\rLessonId: %@ \rTime Start: %@ \rTime End: %@ \rCourse: %@ \rTeacher: %@ \rStudents: %@ \rClassRoom: %@ \r\r", self.lessonId, self.lessonTimeStart, self.lessonTimeEnd, self.course, self.teacher, self.students, self.classRoom];
}
@end
