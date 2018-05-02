//
//  PORIndexItinerariesController.h
//  Portland Rose
//
//  Created by Hunter Ford on 19/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PORItinerary.h"
#import "PORLibrary.h"
#import "PORItinerarySummaryCellView.h"
#warning Remove mocks
#import "PORItinerary+Mocks.h"
#import "PORShowItineraryController.h"


@interface PORIndexItinerariesController : UIViewController <UITableViewDataSource, PORItinerarySummaryCellViewDelegate>

@property PORItineraries * dataSource;

@end
