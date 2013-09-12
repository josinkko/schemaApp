//
//  StorageToFile.h
//  schemApp
//
//  Created by Patrik Sundbäck on 9/12/13.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StorageToFile : NSObject

-(NSString*) dataFilePath;
-(void)writePlist;
-(void) readPlist;
@end
