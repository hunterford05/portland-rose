//
//  PORItineraryHeaderCellDemoViewController.m
//  Portland Rose
//
//  Created by Hunter Ford on 18/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORItineraryHeaderCellDemoViewController.h"

static NSUInteger const COUNT_ROWS = 1;

@interface PORItineraryHeaderCellDemoViewController ()

@property NSArray <PORItinerary *> * itineraries;

@end

@implementation PORItineraryHeaderCellDemoViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  _itineraries = [PORItinerary mocks: COUNT_ROWS];
}


#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  UITableViewCell * cell;
  
  cell = [tableView dequeueReusableCellWithIdentifier: [PORItineraryHeaderCellView reuseIdentifier]];
  if (!cell){
    [tableView registerNib:[UINib nibWithNibName:[PORItineraryHeaderCellView nibName] bundle:nil] forCellReuseIdentifier:[PORItineraryHeaderCellView reuseIdentifier]];
    cell = [tableView dequeueReusableCellWithIdentifier: [PORItineraryHeaderCellView reuseIdentifier]];
  }
  
  [((PORItineraryHeaderCellView *) cell) setItinerary: _itineraries[indexPath.row]];
  
  return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return COUNT_ROWS;
}



@end
