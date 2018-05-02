//
//  PORShowItineraryController.h
//  Portland Rose
//
//  Created by Hunter Ford on 19/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORActivityCellView.h"
#import "PORItinerary.h"
#import "PORLibrary.h"
#import "PORItineraryHeaderCellView.h"
#import <UIKit/UIKit.h>

@interface PORShowItineraryController : UIViewController <UITableViewDataSource>

@property (nonatomic) PORItinerary * itinerary;

@end
