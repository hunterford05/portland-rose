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
  self.dataSource = [[PORLibrary sharedLibrary] itinerariesPinned];
  [super viewDidLoad];
}


@end
