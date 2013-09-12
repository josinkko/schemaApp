//
//  Course.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-11.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "Course.h"

@implementation Course
@synthesize courseName,courseDescription,courseReadingMaterial,courseId;


#pragma mark - Course init methods
- (id)init
{
    return [self initWithCourseName:@"" courseDescription:@"" courseReadingMaterial:@"" courseId:@""];
}

-(id) initWithCourseName: (NSString*) targetCourseName courseDescription: (NSString*) targetCourseDescription courseReadingMaterial: (NSString*)targetReadingMaterial courseId: (NSString*) targetCourseId
{
    self = [super init];
    if (self) {
        self.courseId = targetCourseId;
        self.courseName = targetCourseName;
        self.courseDescription = targetCourseDescription;
        self.courseReadingMaterial = targetReadingMaterial;
    }
    return self;
}

#pragma mark - Return methods

-(NSDictionary*)returnCourseAsNSDictionary
{
    /*
     This method converts all the Course properties to a NSMutableDictionary.
     We need this method to save lesson as data.
     The entire dictionary will look like this:
     {
     courseName: courseNameValue
     courseDescription: courseDescriptionValue
     courseReadingMaterial: courseReadingMaterialValue
     courseId: courseIdValue
     }
     */
    NSMutableDictionary *courseAsDictionary = [[NSMutableDictionary alloc]init];

    [courseAsDictionary setValue:self.courseName forKey:@"courseName"];
    [courseAsDictionary setValue:self.courseDescription forKey:@"courseDescription"];
    [courseAsDictionary setValue:self.courseReadingMaterial forKey:@"courseReadingMaterial"];
    [courseAsDictionary setValue:self.courseId forKey:@"courseId"];

    return courseAsDictionary;
}

+(id)returnCourseFromDictionary: (NSDictionary*)targetCourseAsNSDictionary
{
    Course *courseFromDict = [[Course alloc]init];
    courseFromDict.courseName = targetCourseAsNSDictionary[@"courseName"];
    courseFromDict.courseDescription = targetCourseAsNSDictionary[@"courseDescription"];
    courseFromDict.courseReadingMaterial = targetCourseAsNSDictionary[@"courseReadingMaterial"];
    courseFromDict.courseId = targetCourseAsNSDictionary[@"courseId"];
    return courseFromDict;
}



#pragma mark - NSSet verification if Course objects are equal

-(NSUInteger)hash{
    return 37 * [self.courseId hash];
}
-(BOOL)isEqual:(id)object{
    if (self == object)
    {
        return YES;
    } else if (object && [object isMemberOfClass:[self class]])
    {
        return [self.courseId isEqualToString:[object courseId]];
    } else
    {
        return NO;
    }
}

#pragma mark - Course object Description for NSLog

-(NSString *)description
{
    return [NSString stringWithFormat: @"\rCourse: %@\rDescription: %@\rReadinMtr %@",self.courseName, self.courseDescription,self.courseReadingMaterial];
}
@end