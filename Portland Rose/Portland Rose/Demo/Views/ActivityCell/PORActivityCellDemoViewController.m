//
//  PORActivityCellDemoViewController.m
//  Portland Rose
//
//  Created by Hunter Ford on 12/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORActivityCellDemoViewController.h"

/// Number of activities to display
static NSUInteger const COUNT_ROWS = 5;

@interface PORActivityCellDemoViewController ()

@end

@implementation PORActivityCellDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
  return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return COUNT_ROWS;
}

@end
