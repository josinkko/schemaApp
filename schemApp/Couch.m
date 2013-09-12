//
//  Couch.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-12.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "Couch.h"

@implementation Couch
{
    NSOperationQueue *queue;
}

+(id) parseData:(NSData*)data
{
    NSError *error;
    id values = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    return values;
}

+(NSString*) jsonValue:(NSDictionary*) dict
{
    NSError *error;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

-(id) init
{
    self = [super init];
    if(self) {
        queue =[[NSOperationQueue alloc] init];
        
        
    }
    return self;
}



-(void) reqToUrl:(NSString*)url HttpMethod:(NSString*)Method body:(NSString*)body onComplete:(onRequestComplete)callback;
{
    [NSURLConnection sendAsynchronousRequest:[self reqWithString:url
                                                      HttpMethod:Method body:body]
                                       queue:queue completionHandler:callback];
}

-(NSMutableURLRequest*) reqWithString:(NSString*)reqUrl HttpMethod:(NSString*)Method body:(NSString*)body
{
    NSURL *url =[NSURL URLWithString:reqUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    if([Method isEqual:@"POST"]  || [Method isEqual:@"PUT"] || [Method isEqual:@"DELETE"])
    {
        NSData *reqData = [NSData dataWithBytes:[body UTF8String]length:[body length]];
        [request setHTTPMethod:Method];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        if(body) {
            [request setHTTPBody:reqData];
            
        }
    }
    return request;
    
}




@end