//
//  Student.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-11.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//



#import "Student.h"
#import "StudentMethods.h"

@implementation Student
{
    /*
     A student only contains properties.
     To use student methods we import StudentMethods
     */
    
    StudentMethods *studentMethods;
}


#pragma mark - Student init methods
/*
 These Init methods will not be needed when we use Core Data!
 We will need to update these two methods.
 */
@synthesize firstName, lastName, studentSignum, unreadMessages,readMessages;
- (id)init
{
    
    return [self initWithFirstName:@"UserFromInitFirstName" lastName:@"UserFromInitLastName" studentSignum:@"8001011234"];
}

-(id) initWithFirstName: (NSString*) targetFirstName lastName: (NSString*) targetLastName studentSignum: (NSString*)targetSignum
{
    self = [super init];
    if (self) {
        self.studentSignum = targetSignum;
        self.firstName = targetFirstName;
        self.lastName = targetLastName;
        studentMethods = [[StudentMethods alloc]init];
        unreadMessages = [[NSMutableArray alloc]init];
        readMessages = [[NSMutableArray alloc]init];
    }
    return self;
}

#pragma mark - Show Lessons methods

-(void) showLessonsForDate: (NSString*) yyyyMMdd
{
    //Code..
}
-(void) showLessonsForWeek: (NSString*) targetWeek
{
    //Code..
}

#pragma mark - Message methods
-(void) sendMessage: (NSString*) targetMessage ToSpecificUser: (id<User>) targetUser
{
    //Code..
}
-(void) readUnreadMessages
{
    //Code..
}

#pragma mark - Return methods
-(NSDictionary*)returnStudentAsNSDictionary
{
    /*
     This method converts all the Student properties to a NSMutableDictionary.
     We need this method to save lesson as data.
     The entire dictionary will look like this:
     {
     firstName: firstNameValue,
     lastName: lastNameValue,
     studentSignum: studentSignumValue,
     unreadMessages: unreadMessagesValue,
     readMessages: readMessagesValue
     }
     */
    NSMutableDictionary *studentAsDict = [NSMutableDictionary new];
    [studentAsDict setValue:self.firstName forKey:@"firstName"];
    [studentAsDict setValue:self.lastName forKey:@"lastName"];
    [studentAsDict setValue:self.studentSignum forKey:@"studentSignum"];
    [studentAsDict setValue:self.unreadMessages forKey:@"unreadMessages"];
    [studentAsDict setValue:self.readMessages forKey:@"readMessages"];
    
    return studentAsDict;
}
+(id)returnStudentFromDictionary: (NSDictionary*)targetStudentAsNSDictionary
{
    Student *studentFromDict = [Student new];
    studentFromDict.firstName = targetStudentAsNSDictionary[@"firstName"];
    studentFromDict.lastName = targetStudentAsNSDictionary[@"lastName"];
    studentFromDict.studentSignum = targetStudentAsNSDictionary[@"studentSignum"];
    studentFromDict.unreadMessages = targetStudentAsNSDictionary[@"unreadMessages"];
    studentFromDict.readMessages = targetStudentAsNSDictionary[@"readMessages"];
    
    return studentFromDict;
}


#pragma mark - NSSet verification if Student objects are equal

/*
 In order to confirm that each studen is unique we define hash and isEqual.
 */

-(NSUInteger)hash
{
    return 37 * [self.studentSignum hash];
}
-(BOOL)isEqual:(id)object{
    if (self == object)
    {
        return YES;
    } else if (object && [object isMemberOfClass:[self class]])
    {
        return [self.studentSignum isEqualToString:[object studentSignum]];
    } else
    {
        return NO;
    }
}

#pragma mark - Student object Description for NSLog

/*
 When loggin our student we are only interested in firstName and lastName.
 */
-(NSString*)description
{
    return [NSString stringWithFormat:@"\rFirst Name: %@ \rLast Name: %@",self.firstName, self.lastName];
}
@end