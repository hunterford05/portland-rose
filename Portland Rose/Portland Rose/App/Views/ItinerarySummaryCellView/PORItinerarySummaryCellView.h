//
//  PORItinerarySummaryCellView.h
//  Portland Rose
//
//  Created by Hunter Ford on 11/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PORItinerarySummaryView.h"

IB_DESIGNABLE

@interface PORItinerarySummaryCellView : UITableViewCell

/// Table cell index
@property NSUInteger index;
// Itinerary summary view
@property PORItinerarySummaryView * viewItinerarySummary;

@end
