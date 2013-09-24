//
//  LessonDetailViewController.h
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-24.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LessonDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *courseInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *courseReadingInfoLabel;

@end
