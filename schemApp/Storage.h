//
//  Storage.h
//  schemApp
//
//  Created by Patrik Sundbäck on 9/11/13.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Storage : NSObject
@property (nonatomic, strong) NSMutableArray *courses;
@property (nonatomic, strong) NSMutableArray *lessons;
@property (nonatomic, strong) NSMutableArray *students;

+(Storage*)sharedStorage;

-(NSArray*)returnStorageAsNSArray;
+(id)returnStorageFromArray: (NSArray*)targetStorageAsNSArray;

@end
