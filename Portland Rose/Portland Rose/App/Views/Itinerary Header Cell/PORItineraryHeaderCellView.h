//
//  PORItineraryHeaderCellView.h
//  Portland Rose
//
//  Created by Hunter Ford on 18/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORImageCarouselView.h"
#import "PORItinerary.h"
#import "PORLabeledIconView.h"
#import "PORPalette.h"
#import "PORTypeLibrary.h"
#import <UIKit/UIKit.h>

@interface PORItineraryHeaderCellView : UITableViewCell <PORImageCarouselDelegate>

@property (nonatomic) PORItinerary * itinerary;

/**
 * This class' reuse identifier.
 */
+ (NSString *) reuseIdentifier;
/**
 * This class' nib name.
 */
+ (NSString *) nibName;

@end
