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
/// Demo itinerary
@property NSArray <PORItinerary *> * itineraries;

@end

@implementation PORItinerarySummaryDemoViewController

#pragma mark - lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  [self loadIcons];
  [self loadItinerary];
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

- (void) loadItinerary {
  _itineraries = [PORItinerary mocks: 5];
}

#pragma mark - events

#pragma mark - <PORItinerarySummaryCellViewDelegate>

- (void) didSelectItineraryAtIndex:(NSUInteger)index{
  NSLog(@"Did select itinerary #%lu", (unsigned long) index);
}

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
  [iCell setItinerary: _itineraries[index]];
  [iCell setIndex:index];
  [iCell setDelegate: self];
  
  return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_itineraries count];
}

@end
