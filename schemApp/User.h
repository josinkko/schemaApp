//
//  User.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-11.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol User <NSObject>

@property (nonatomic, copy) NSMutableArray *unreadMessages;
@property (nonatomic, copy) NSMutableArray *readMessages;

-(void) sendMessage: (NSString*) targetMessage ToSpecificUser: (id<User>) targetUser;
-(void) readUnreadMessages;

@end

