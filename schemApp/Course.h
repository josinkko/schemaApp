//
//  Course.h
//  schemApp
//
//  Created by Patrik Sundbäck on 9/19/13.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Lesson, Student;

@interface Course : NSManagedObject

@property (nonatomic, retain) NSString * courseDescription;
@property (nonatomic, retain) NSString * courseId;
@property (nonatomic, retain) NSString * courseName;
@property (nonatomic, retain) NSString * courseReadingMaterial;
@property (nonatomic, retain) NSSet *student;
@property (nonatomic, retain) Lesson *lesson;
@end

@interface Course (CoreDataGeneratedAccessors)

- (void)addStudentObject:(Student *)value;
- (void)removeStudentObject:(Student *)value;
- (void)addStudent:(NSSet *)values;
- (void)removeStudent:(NSSet *)values;

@end
