//
//  Storage.h
//  schemApp
//
//  Created by Jimmy Lidström on 2013-09-16.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Storage : NSObject

@property (nonatomic, readonly, strong)NSManagedObjectContext *context;

+(Storage*) sharedStorage;

+(void) saveManagedContext:(NSManagedObjectContext*) targetContext;
+(void) readData;

@end
