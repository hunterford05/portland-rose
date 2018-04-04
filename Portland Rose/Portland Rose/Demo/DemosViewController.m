//
//  DemosViewController.m
//  Portland Rose
//
//  Created by Hunter Ford on 02/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "DemosViewController.h"

/// Comma-seperated list of demo views. IMPORTANT: These names must correspond to a valid segue identifier with the convention `"FromDemosTo<NAME_OF_DEMO>"`. For example, if `"Puffins Demo"` is part of the `NAMES_DEMO` list, this view controller will assume that there is a segue with the identifier `"FromDemosToPuffinsDemo"`.
static NSString * const NAMES_DEMO = @"Action Button View Demo, Palette Demo,Type Library Demo";
/// Reuse identifier for the demo table cell
static NSString * const REUSE_IDENTIFIER_CELL_DEMO = @"DemoCell";
/// Demos View Controller scene title
static NSString * const TITLE = @"Demos";


@interface DemosViewController ()

/// Array of demo names.
@property NSArray * namesDemo;

@end

@implementation DemosViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self setTitle:TITLE];
  
  if ([NAMES_DEMO isEqualToString:@""]){
    _namesDemo = @[];
  } else {
    _namesDemo = [NSArray arrayWithArray: [NAMES_DEMO componentsSeparatedByString:@","]];
  }
}

#pragma mark - <UITableViewDelegate>

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString * scene;
  NSString * sid;
  NSInteger row;
  
  row = indexPath.row;
  scene = [_namesDemo[row] stringByReplacingOccurrencesOfString:@" " withString:@""];
  sid = [NSString stringWithFormat:@"FromDemosTo%@", scene];
  
  [self performSegueWithIdentifier:sid sender:self];
}

# pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSInteger row;
  UITableViewCell * cell;
  
  row = indexPath.row;
  cell = [tableView dequeueReusableCellWithIdentifier:REUSE_IDENTIFIER_CELL_DEMO];
  cell.textLabel.text = _namesDemo[row];
  
  return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return [_namesDemo count];
}

@end
