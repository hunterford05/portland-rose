//
//  PORShowItineraryController.m
//  Portland Rose
//
//  Created by Hunter Ford on 19/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORShowItineraryController.h"

static NSString * const REUSE_IDENTIFIER_ITINERARY_HEADER = @"ItineraryHeaderCell";
static NSString * const REUSE_IDENTIFIER_ACTIVITY = @"ActivityCell";
static NSInteger const NUMBER_SECTIONS = 2;

@interface PORShowItineraryController ()

@property (weak, nonatomic) IBOutlet UITableView *viewTable;

@end

@implementation PORShowItineraryController

#pragma mark - lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self setUpViewTable];
}

#pragma mark - events

- (IBAction)didTapFloatingActionButton:(id)sender {
  [[[PORLibrary sharedLibrary] itinerariesPinned] createRecord:_itinerary];
}


#pragma mark - helpers

- (void)setUpViewTable{
  [_viewTable setDataSource: self];
}

- (PORItineraryHeaderCellView *) itineraryHeaderCell{
  PORItineraryHeaderCellView * cell;
  
  cell = (PORItineraryHeaderCellView *)[_viewTable dequeueReusableCellWithIdentifier: [PORItineraryHeaderCellView reuseIdentifier]];
  if (!cell){
    [_viewTable registerNib:[UINib nibWithNibName:[PORItineraryHeaderCellView nibName] bundle:nil] forCellReuseIdentifier:[PORItineraryHeaderCellView reuseIdentifier]];
    cell = (PORItineraryHeaderCellView *)[_viewTable dequeueReusableCellWithIdentifier: [PORItineraryHeaderCellView reuseIdentifier]];
  }
  
  [cell setItinerary:_itinerary];
  
  return cell;
}

- (PORActivityCellView *) activityCellForRow:(NSUInteger)row{
  PORActivityCellView * cell;
  
  // Dequeue a reusable cell
  cell = (PORActivityCellView *)[_viewTable dequeueReusableCellWithIdentifier:[PORActivityCellView reuseIdentifier]];
  // if necessary, register the nib and try to dequeue again
  if (!cell){
    [_viewTable registerNib:[UINib nibWithNibName: [PORActivityCellView nibName] bundle: nil] forCellReuseIdentifier:[PORActivityCellView reuseIdentifier]];
    cell = (PORActivityCellView *)[_viewTable dequeueReusableCellWithIdentifier:[PORActivityCellView reuseIdentifier]];
  }
    [cell setActivity:_itinerary.activities[row]];
  
  return cell;
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  return NUMBER_SECTIONS;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  NSUInteger section;
  NSUInteger row;
  UITableViewCell * cell;
  
  section = indexPath.section;
  row = indexPath.row;
  if (section == 0){
    cell = (UITableViewCell *)[self itineraryHeaderCell];
  } else {
    cell = (UITableViewCell *)[self activityCellForRow:row];
  }
  
  return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  if (!section){
    return 1;
  } else {
    return [_itinerary.activities count];
  }
}

@end
