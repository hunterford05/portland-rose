//
//  PORIndexItinerariesController.m
//  Portland Rose
//
//  Created by Hunter Ford on 19/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORIndexItinerariesController.h"

static NSInteger const NUMBER_SECTIONS = 1;
static NSString * const REUSE_IDENTIFIER_ITINERARY_CELL = @"ItineraryCell";
static NSString * const NAME_SEGUE_SHOW_ITINERARY = @"FromIndexItinerariesToShowItinerary";

@interface PORIndexItinerariesController ()

@property (weak, nonatomic) IBOutlet UITableView *viewTable;

@property PORItinerary * selectedItinerary;
@property NSArray <PORItinerary *> * itineraries;

@end

@implementation PORIndexItinerariesController

- (void)viewDidLoad {
  [super viewDidLoad];  
  [self loadItineraries];
  [self setUpViewTable];
}

#pragma mark - navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  if ([segue.identifier isEqualToString:NAME_SEGUE_SHOW_ITINERARY]){
    PORShowItineraryController * sic;
    sic = (PORShowItineraryController *)segue.destinationViewController;
    [sic setItinerary: _selectedItinerary];
  }
}

#pragma mark - helpers

- (void)loadItineraries{
  _itineraries = [_dataSource allItineraries];
}

- (void)refresh{
  [self loadItineraries];
  [_viewTable reloadData];
}

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


@end
