//
//  PORItinerary.h
//  Portland Rose
//
//  Created by Hunter Ford on 12/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PORActivity.h"
#import "PORBadge.h"
#import "PORRecord.h"
#import <UIKit/UIKit.h>

@class PORItinerary;

typedef NSArray <PORItinerary *> PORItineraries;

@interface PORItinerary : PORRecord

/// The activities in this itinerary
@property NSArray * activities;
/// The itinerary's badges
@property NSArray * badges;
/// Itinerary cost (lower estimate, dollars)
@property NSUInteger costLower;
/// Itinerary cost (upper estimate, dollars)
@property NSUInteger costUpper;
/// Itinerary duration (minutes)
@property NSUInteger duration;
/// Primary image
@property UIImage * imageMain;
/// Secondary image(s)
@property NSArray * imagesSecondary;
/// Itinerary title
@property NSString * title;

/**
 * Returns an array of badge icons as `UIImage`s
 */
- (NSArray *) badgeIcons;

/**
 * Returns an array containing the itinerary's primary *and* secondary images.
 */
- (NSArray <UIImage *> *) allImages;


@end
