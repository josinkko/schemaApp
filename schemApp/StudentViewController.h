//
//  StudentViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-10.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentViewController : UIViewController
- (IBAction)Back:(id)sender;
- (IBAction)ReadMessage:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *TodaysLections;

@property (weak, nonatomic) IBOutlet UILabel *MessageToAll;
@property (weak, nonatomic) IBOutlet UITableView *SchemTabelView;
@end
