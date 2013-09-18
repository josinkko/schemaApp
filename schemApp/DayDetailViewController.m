//
//  DayDetailViewController.m
//  schemApp
//
//  Created by sebastian holmqvist on 2013-09-10.
//  Copyright (c) 2013 sebastian holmqvist. All rights reserved.
//

#import "DayDetailViewController.h"

@interface DayDetailViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation DayDetailViewController
{
    NSArray *values;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
}




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        values = @[@"08:00",@"09:00",@"10:00",@"11:00",@"12:00",@"13:00",@"14:00",@"15:00"];
    }
    return self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [values count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if(!cell)
    {
        NSLog(@"Creating new cell");
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    }
    cell.textLabel.text = values[indexPath.row];
    
    return cell;
    
    
    /////// göra en custom cell med två label, en som visar första tiden på dagen och en som visar sista.
    // i cellen finns resterande schema.
    
    
}

- (IBAction)Back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
