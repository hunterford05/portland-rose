//
//  PORIndexItinerariesFeedController.m
//  Portland Rose
//
//  Created by Hunter Ford on 01/05/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORIndexItinerariesFeedController.h"

@interface PORIndexItinerariesFeedController ()

@end

@implementation PORIndexItinerariesFeedController

- (void)viewDidLoad {
  self.dataSource = [[PORLibrary sharedLibrary] itinerariesFeed];
#pragma warning MOCKS
  [self.dataSource createItineraries:[PORItinerary mocks:25]];
  [super viewDidLoad];
}

@end
