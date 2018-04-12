//
//  PORItinerarySummaryDemoViewController.m
//  Portland Rose
//
//  Created by Hunter Ford on 12/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORItinerarySummaryDemoViewController.h"

/// Icon image names
static NSString * const NAMES_ICONS_ITINERARY = @"demo-icon-1,demo-icon-0,demo-icon-2";
/// Reuse identifier
static NSString * const REUSE_IDENTIFIER_ITINERARY_SUMMARY_CELL = @"ItinerarySummaryCell";

@interface PORItinerarySummaryDemoViewController ()

/// Array of UIImages for itinerary
@property NSMutableArray * icons;

@end

@implementation PORItinerarySummaryDemoViewController

#pragma mark - lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  [self loadIcons];
}

#pragma mark - helpers

- (void) loadIcons {
  NSMutableArray * a;
  
  a = [[NSMutableArray alloc] init];
  for (NSString * name in [NAMES_ICONS_ITINERARY componentsSeparatedByString:@","]){
    [a addObject:[UIImage imageNamed:name]];
  }
  _icons = a;
}

#pragma mark - events



#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  NSUInteger index;
  UITableViewCell * cell;
  PORItinerarySummaryCellView * iCell;
  
  index = indexPath.row;
  cell = [tableView dequeueReusableCellWithIdentifier:REUSE_IDENTIFIER_ITINERARY_SUMMARY_CELL];
  iCell = (PORItinerarySummaryCellView *) cell;
  [iCell.viewItinerarySummary setIcons: _icons];
  [iCell setIndex:index];
  
  return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

@end
