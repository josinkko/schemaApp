//
//  Message+Json.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-12.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "Message+Json.h"

@implementation SendMessage (Json)


-(id)jsonValue
{
    NSMutableDictionary *selfAsJson = [[NSMutableDictionary alloc] init];
    
    
    selfAsJson[@"Message"] = self.message;
    selfAsJson[@"From"] = self.from;
    selfAsJson[@"StudentID"] = self.studentId;
    
    
    return selfAsJson;
}

@end