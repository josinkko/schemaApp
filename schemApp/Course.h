//
//  Course.h
//  schemApp
//
//  Created by Jimmy Lidström on 2013-09-16.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Course : NSManagedObject

@property (nonatomic, retain) NSString * courseName;
@property (nonatomic, retain) NSString * courseDescription;
@property (nonatomic, retain) NSString * courseReadingMaterial;
@property (nonatomic, retain) NSString * courseId;
@property (nonatomic, retain) NSString * courseDay;
@property (nonatomic, retain) NSString * courseStart;
@property (nonatomic, retain) NSString * courseStop;

@end
