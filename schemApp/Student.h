//
//  Student.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-11.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Student : NSObject <User>
@property (nonatomic, copy) NSString* studentSignum;
@property (nonatomic, copy) NSString* firstName;
@property (nonatomic, copy) NSString* lastName;
@property (nonatomic, copy) NSMutableArray *unreadMessages;
@property (nonatomic, copy) NSMutableArray *readMessages;

#pragma mark - Init Students
-(id) initWithFirstName: (NSString*) targetFirstName lastName: (NSString*) targetLastName studentSignum: (NSString*)targetSignum;

#pragma mark - Show Lessons methods

-(void) showLessonsForDate: (NSString*) yyyyMMdd;
-(void) showLessonsForWeek: (NSString*) targetWeek;

#pragma mark - Message methods
-(void) sendMessage: (NSString*) targetMessage ToSpecificUser: (id<User>) targetUser;
-(void) readUnreadMessages;

#pragma mark - Return methods
-(NSDictionary*)returnStudentAsNSDictionary;
+(id)returnStudentFromDictionary: (NSDictionary*)targetStudentAsNSDictionary;

@end