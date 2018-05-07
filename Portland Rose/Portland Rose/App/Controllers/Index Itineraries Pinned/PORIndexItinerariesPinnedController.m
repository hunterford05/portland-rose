//
//  PORIndexItinerariesPinnedController.m
//  Portland Rose
//
//  Created by Hunter Ford on 01/05/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORIndexItinerariesPinnedController.h"

@interface PORIndexItinerariesPinnedController ()

@end

@implementation PORIndexItinerariesPinnedController

- (void)viewDidLoad {
  // Set data source to the pinned itineraries record book stored in the shared library
  self.dataSource = [[PORLibrary sharedLibrary] itinerariesPinned];
  [super viewDidLoad];
}


@end
