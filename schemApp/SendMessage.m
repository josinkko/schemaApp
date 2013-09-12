//
//  SendMessage.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-12.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "SendMessage.h"

@implementation SendMessage

+(id) messageFromJson:(NSDictionary*)messageAsJson
{
    SendMessage *message = [[self alloc] init];
    message.message = messageAsJson[@"Message"];
    message.from = messageAsJson[@"From"];
    message.message = messageAsJson[@"StudentId"];
    
    
    return message;
}

-(id) init
{
    return [self initWithMessage:@"" From:@"" StudentId:@""];
}

-(id) initWithMessage:(NSString*) message From:(NSString*) from StudentId:(NSString*)studentId
{
    self = [super init];
    
    if(self) {
        self.message = message;
        self.from = from;
        self.studentId =studentId;
        
    }
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"%@, %@, %@", self.message, self.from, self.studentId];
}





-(NSDictionary*)dictionary
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    dict[@"Message"] = self.message;
    dict[@"From"] = self.from;
    dict[@"StudentId"] = self.studentId;
    
    return dict;
}
-(NSString*)json
{
    return [Couch jsonValue:[self dictionary]];
}





@end