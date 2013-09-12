//
//  Storage.m
//  schemApp
//
//  Created by Patrik Sundbäck on 9/11/13.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "Storage.h"
#import "Course.h"
#import "Lesson.h"
#import "Student.h"

@implementation Storage
@synthesize courses,lessons,students;

- (id)init
{
    self = [super init];
    if (self) {
        courses = [NSMutableArray new];
        lessons = [NSMutableArray new];
        students = [NSMutableArray new];
    }
    return self;
}
+(Storage*)sharedStorage
{
    static Storage *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [Storage new];
    });
    
    return sharedInstance;
}

#pragma mark - Return Methods

-(NSArray*)returnStorageAsNSArray
{
    /*
     This method converts Storage properties to a NSMutableArray.
     We need this method to save lesson as data.
     The entire array will look like this:
     [
        {
            courseName: courseNameValue
            courseDescription: courseDescriptionValue
            courseReadingMaterial: courseReadingMaterialValue
            courseId: courseIdValue
        },
        {
            courseName: courseNameValue
            courseDescription: courseDescriptionValue
            courseReadingMaterial: courseReadingMaterialValue
            courseId: courseIdValue
        }
     ]
     */
    NSMutableArray *storageArray = [NSMutableArray new];
    for (Course *course in courses) {
        [storageArray addObject:[course returnCourseAsNSDictionary]];
    }
    return storageArray;
}
+(id)returnStorageFromArray: (NSArray*)targetStorageAsNSArray
{
    NSMutableArray *coursesFromArray = [NSMutableArray new];
    
    for (NSMutableDictionary *courseAsDict in targetStorageAsNSArray) {
        [coursesFromArray addObject:[Course returnCourseFromDictionary:courseAsDict]];
    }
    
    return coursesFromArray;
}

@end
