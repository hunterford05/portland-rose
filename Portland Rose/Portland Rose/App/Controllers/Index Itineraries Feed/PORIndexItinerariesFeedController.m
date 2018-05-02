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
  // Set the data source to the shared library's feed itineraries record book
  self.dataSource = [[PORLibrary sharedLibrary] itinerariesFeed];
  [super viewDidLoad];
}

@end
