//
//  AppDelegate.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-09.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "Couch.h"
#import "SendMessage.h"
@implementation AppDelegate

@synthesize messages;
@synthesize arrayCourses;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    MainViewController *mvc =[MainViewController new];
    self.window.rootViewController = mvc;
    [self loadMessages];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    return YES;
    
    
}

#pragma mark - Message Methods
-(void)loadMessages
{
    Couch *couch = [[Couch alloc] init];
    self.messages = [NSMutableArray new];
    [couch reqToUrl:@"http://schempp.iriscouch.com/messages/_design/design/_view/allMessages" HttpMethod:@"GET" body:@"" onComplete:^(NSURLResponse *response, NSData *data, NSError *error) {
        NSLog(@"Fetching Messages");
        if (data) {
            for (NSDictionary *dic in [[Couch parseData:data] objectForKey:@"rows"]) {
                NSDictionary *asDic = [dic valueForKey:@"value"];
                [messages addObject:[[SendMessage alloc] initWithMessage:[asDic valueForKey:@"Message"] From:[asDic valueForKey:@"From"] StudentId:[asDic valueForKey:@"StudentId"]Time:[asDic valueForKey:@"Time"]]];
            }
            NSLog(@"%@",self.messages);
        } else {
            [messages addObject:[[SendMessage alloc]initWithMessage:@"No Connection" From:@"Master" StudentId:@"messageToAll" Time:@"no time"]];
            NSLog(@"Could not find data!");
        }
        
    }];
}

@end
