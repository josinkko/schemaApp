//
//  Lesson.h
//  schemApp
//
//  Created by Patrik Sundbäck on 9/19/13.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Course;

@interface Lesson : NSManagedObject

@property (nonatomic, retain) NSString * mondayStart;
@property (nonatomic, retain) NSString * mondayStop;
@property (nonatomic, retain) NSString * tuesdayStart;
@property (nonatomic, retain) NSString * tuesdayStop;
@property (nonatomic, retain) NSString * wednesdayStart;
@property (nonatomic, retain) NSString * wednesdayStop;
@property (nonatomic, retain) NSString * thursdayStart;
@property (nonatomic, retain) NSString * thursdayStop;
@property (nonatomic, retain) NSString * fridayStart;
@property (nonatomic, retain) NSString * fridayStop;
@property (nonatomic, retain) Course *course;

@end
