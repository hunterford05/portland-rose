//
//  PORIndexItinerariesController.m
//  Portland Rose
//
//  Created by Hunter Ford on 19/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORIndexItinerariesController.h"

static NSInteger const NUMBER_SECTIONS = 1;
static NSString * const NAME_SEGUE_SHOW_ITINERARY = @"FromIndexItinerariesToShowItinerary";
static NSString * const REUSE_IDENTIFIER_ITINERARY_CELL = @"ItineraryCell";

@interface PORIndexItinerariesController ()


/// Itineraries to display
@property PORItineraries * itineraries;
/// The currently-selected itinerary (if any)
@property PORItinerary * selectedItinerary;
/// Table view for displaying itineraries
@property (weak, nonatomic) IBOutlet UITableView *viewTable;

@end

@implementation PORIndexItinerariesController

- (void)viewDidLoad {
  [super viewDidLoad];  
  [self loadItineraries];
  [self setUpViewTable];
}

- (void)viewWillAppear:(BOOL)animated{
  [super viewWillAppear:animated];
  [_dataSource setDelegate:self];
  [self refresh];
}

#pragma mark - navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  // Set the `itinerary` property of the destination `PORShowItineraryController`
  if ([segue.identifier isEqualToString:NAME_SEGUE_SHOW_ITINERARY]){
    PORShowItineraryController * sic;
    sic = (PORShowItineraryController *)segue.destinationViewController;
    [sic setItinerary: _selectedItinerary];
  }
}

#pragma mark - helpers

/**
 * Load itineraries from data source
 */
- (void)loadItineraries{
  _itineraries = [_dataSource allRecords];
}

/**
 * Reload itineraries from data source, then refresh the
 * table view.
 */
- (void)refresh{
  [self loadItineraries];
  [_viewTable reloadData];
}

/**
 * Perform intial table view configuration
 */
- (void)setUpViewTable{
  [_viewTable setDataSource: self];
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  return NUMBER_SECTIONS;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  PORItinerarySummaryCellView * cell;
  NSUInteger index;
  
  index = indexPath.row;
  cell = (PORItinerarySummaryCellView *)[tableView dequeueReusableCellWithIdentifier:REUSE_IDENTIFIER_ITINERARY_CELL];
  [cell setItinerary:_itineraries[index]];
  [cell setIndex:index];
  [cell setDelegate:self];
  
  return (UITableViewCell *)cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return _itineraries ? [_itineraries count] : 0;
}

#pragma mark - <PORItinerarySummaryCellViewDelegate>

- (void)didSelectItineraryAtIndex:(NSUInteger)index{
  [self setSelectedItinerary: _itineraries[index]];
  [self performSegueWithIdentifier:NAME_SEGUE_SHOW_ITINERARY sender:self];
}

#pragma mark - <PORRecordBookDelegate>

- (void)didUpdateRecordBook:(PORRecordBook *)recordBook{
  [self refresh];
}

@end
