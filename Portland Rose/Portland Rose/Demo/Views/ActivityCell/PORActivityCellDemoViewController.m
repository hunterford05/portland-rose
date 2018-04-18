//
//  PORActivityCellDemoViewController.m
//  Portland Rose
//
//  Created by Hunter Ford on 12/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORActivityCellDemoViewController.h"

/// Number of activities to display
static NSUInteger const COUNT_ROWS = 25;

@interface PORActivityCellDemoViewController ()

@property NSArray<PORActivity *> * activities;

@end

@implementation PORActivityCellDemoViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  _activities = [PORActivity mocks: COUNT_ROWS];
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  UITableViewCell * cell;
  
  cell = [tableView dequeueReusableCellWithIdentifier:[PORActivityCellView reuseIdentifier]];
  if (!cell){
    [tableView registerNib:[UINib nibWithNibName: [PORActivityCellView nibName] bundle: nil] forCellReuseIdentifier:[PORActivityCellView reuseIdentifier]];
    cell = [tableView dequeueReusableCellWithIdentifier:[PORActivityCellView reuseIdentifier]];
  }
  [((PORActivityCellView *) cell) setActivity: _activities[indexPath.row]];

  return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_activities count];
}

@end
