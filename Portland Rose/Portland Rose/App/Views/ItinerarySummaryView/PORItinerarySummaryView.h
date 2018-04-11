//
//  PORItinerarySummaryView.h
//  Portland Rose
//
//  Created by Hunter Ford on 11/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PORImageCardView.h"
#import "PORPalette.h"
#import "PORTypeLibrary.h"
#import "PORActionButtonView.h"

IB_DESIGNABLE

@interface PORItinerarySummaryView : UIView

/// Itineray cost (dollars, lower bound)
@property (nonatomic) IBInspectable NSUInteger costLower;
/// Itinerary cost (dollars, upper bound)
@property (nonatomic) IBInspectable NSUInteger costUpper;
/// Itinerary duration (minutes)
@property (nonatomic) IBInspectable NSUInteger duration;
/// Itinerary image
@property (nonatomic) IBInspectable UIImage * image;
/// Itineray title
@property (nonatomic) IBInspectable NSString * title;
/// Show itinerary button
@property (weak, nonatomic) IBOutlet PORActionButtonView *viewButtonShowItinerary;


@end
