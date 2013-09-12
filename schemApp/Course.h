//
//  Course.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-11.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Course : NSObject
@property (nonatomic, copy) NSString* courseName;
@property (nonatomic, copy) NSString* courseDescription;
@property (nonatomic, copy) NSString* courseReadingMaterial;
@property (nonatomic, copy) NSString* courseId;

-(id) initWithCourseName: (NSString*) targetCourseName courseDescription: (NSString*) targetCourseDescription courseReadingMaterial: (NSString*)targetReadingMaterial courseId: (NSString*) targetCourseId;

-(NSDictionary*)returnCourseAsNSDictionary;
+(id)returnCourseFromDictionary: (NSDictionary*)targetCourseAsNSDictionary;

@end
