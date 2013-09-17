//
//  Storage.m
//  schemApp
//
//  Created by Jimmy Lidström on 2013-09-16.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "Storage.h"
#import "Course.h"
#import "Student.h"

@interface Storage ()

@property (nonatomic, readwrite, strong)NSManagedObjectContext *context;
@property (nonatomic, strong)NSManagedObjectModel *model;
@property (nonatomic, strong)NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation Storage

#pragma mark - Shared CoreData Storage

+(Storage*)sharedStorage
{

    static Storage *sharedInstance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [Storage new];
    });
    
    return sharedInstance;
}

#pragma mark - Public context

-(NSManagedObjectContext*)context
{
    if (!_context) {
        _context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        _context.persistentStoreCoordinator = [self persistentStoreCoordinator];
    }
    return _context;
}

#pragma mark - Public CRUD helpers

+(void) saveManagedContext:(NSManagedObjectContext*) targetContext
{
    NSError *error;
    
    if ([targetContext save:&error]) {
        NSLog(@"Context saved");
    } else {
        NSLog(@"Could not save context. Error: %@", [error localizedDescription]);
    }
}

+(void) readData
{
    NSManagedObjectContext *readContext = [Storage sharedStorage].context;
    
    NSFetchRequest *courseRequest = [NSFetchRequest fetchRequestWithEntityName:@"Course"];
    NSFetchRequest *studentRequest = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    NSArray * courseResult = [readContext executeFetchRequest:courseRequest error:nil];
    NSArray * studentResult = [readContext executeFetchRequest:studentRequest error:nil];
    
    for (Course *course in courseResult) {
        NSLog(@" \r%@, \r%@, \r%@, \r%@, \r%@, \r%@", course.courseName, course.courseDescription, course.courseReadingMaterial, course.courseDay, course.courseStart, course.courseStop);
    }
    for (Student *student in studentResult) {
        NSLog(@" \r%@, \r%@, \r%@", student.firstName, student.lastName, student.studentSignum);
    }
}

#pragma mark - Private model and PersistentStoreCoordinator

-(NSManagedObjectModel *)model
{
    if (!_model) {
        _model = [[NSManagedObjectModel alloc] initWithContentsOfURL:[self modelPath]];
    }
    return _model;
}

-(NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (!_persistentStoreCoordinator) {
        NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.model];
        NSError *error;
        
        if (![psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[self storeURL] options:nil error:&error]) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Could not create persistant store" userInfo:error.userInfo];
        }
        _persistentStoreCoordinator = psc;
    }
    return _persistentStoreCoordinator;
}

#pragma mark - Private Path Helpers

-(NSString*)modelName
{
    return @"schemApp";
}

-(NSURL*)modelPath
{
    return [[NSBundle mainBundle] URLForResource:[self modelName] withExtension:@"momd"];
}
 -(NSString*) storeFileName
{
    return [[self modelName]stringByAppendingPathExtension:@"sqlite"];
}

-(NSURL*)storeURL
{
    return [[self documentDirectory] URLByAppendingPathComponent: [self storeFileName]];
}

-(NSURL*) documentDirectory
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentDirectoryURL = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    
    return documentDirectoryURL;
}

@end
