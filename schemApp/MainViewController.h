//
//  MainViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-09.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController {
IBOutlet UILabel *Datelabel;

}
- (IBAction)AdminButton:(id)sender;
- (IBAction)StudentButton:(id)sender;
@property (strong,nonatomic) NSMutableArray *courses;
@property (strong,nonatomic) NSMutableArray *students;

@end
