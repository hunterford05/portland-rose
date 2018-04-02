//
//  DemosViewController.m
//  Portland Rose
//
//  Created by Hunter Ford on 02/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "DemosViewController.h"

NSString * const TITLE = @"Demos";
NSString * const NAMES_DEMO = @"Puffin View,Raccoon View";
NSString * const REUSE_IDENTIFIER_CELL_DEMO = @"DemoCell";

@interface DemosViewController ()

@end

@implementation DemosViewController{
  NSArray * namesDemo;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self setTitle:TITLE];
  namesDemo = [NSArray arrayWithArray: [NAMES_DEMO componentsSeparatedByString:@","]];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString * scene;
  NSString * sid;
  NSInteger row;
  
  row = indexPath.row;
  scene = [namesDemo[row] stringByReplacingOccurrencesOfString:@" " withString:@""];
  sid = [NSString stringWithFormat:@"FromDemosTo%@Demo", scene];
  
  [self performSegueWithIdentifier:sid sender:self];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSInteger row;
  UITableViewCell * cell;
  
  row = indexPath.row;
  cell = [tableView dequeueReusableCellWithIdentifier:REUSE_IDENTIFIER_CELL_DEMO];
  cell.textLabel.text = namesDemo[row];
  
  return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return [namesDemo count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

@end
