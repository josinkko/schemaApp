//
//  StorageToFile.m
//  schemApp
//
//  Created by Patrik Sundbäck on 9/12/13.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "StorageToFile.h"
#import "Storage.h"
@implementation StorageToFile
{
    Storage *storage;
}
- (id)init
{
    self = [super init];
    if (self) {
        storage = [Storage sharedStorage];
    }
    return self;
}

-(NSString*) dataFilePath
{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [path objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:@"list.plist"];
}

-(void)writePlist
{
    //Code...
}
-(void) readPlist
{
    //Code...
}

@end
