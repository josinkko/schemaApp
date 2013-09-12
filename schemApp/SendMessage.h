//
//  SendMessage.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-12.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Couch.h"
@interface SendMessage : NSObject
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *from;
@property (nonatomic, copy) NSString *studentId;


-(id) initWithMessage:(NSString*) message From:(NSString*)from StudentId:(NSString*)studentId;
+(id) messageFromJson:(NSDictionary*) messageAsJson;


-(NSString*)json;
-(NSDictionary*)dictionary;

@end