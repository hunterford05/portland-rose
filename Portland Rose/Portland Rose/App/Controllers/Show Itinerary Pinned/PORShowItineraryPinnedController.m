//
//  PORShowItineraryPinnedController.m
//  Portland Rose
//
//  Created by Hunter Ford on 02/05/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORShowItineraryPinnedController.h"

@interface PORShowItineraryPinnedController ()

@end

@implementation PORShowItineraryPinnedController

- (void)viewDidLoad {
  [super viewDidLoad];
}


- (void)didTapFloatingActionButton:(id)sender{
  [[[PORLibrary sharedLibrary] itinerariesPinned] destroyRecordWithIdentifier: self.itinerary.identifier];
  [self.navigationController popViewControllerAnimated:YES];
}


@end
