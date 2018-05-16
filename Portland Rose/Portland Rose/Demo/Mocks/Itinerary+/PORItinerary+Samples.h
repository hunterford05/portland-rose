//
//  PORItinerary+Samples.h
//  Portland Rose
//
//  Created by Hunter Ford on 15/05/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORItinerary.h"
#import "PORActivity+Samples.h"
#import "PORBadge+Samples.h"

@interface PORItinerary (Samples)

/**
 * Return all available sample itineraries.
 */
+ (PORItineraries *) allSamples;
/**
 * Return a sample itinerary set at Chelsea Market and on
 * the High Line.
 */
+ (PORItinerary *) chelseaMarketAndHighLineItinerary;
/**
 * Return a sample itinerary that includes East Village
 * speakeasies.
 */
+ (PORItinerary *) eastVillageSpeakeasyTourItinerary;
/**
 * Return a sample itinerary set in Washington Square Park.
 */
+ (PORItinerary *) moonlightWashingtonSquareParkItinerary;
/**
 * Return a sample itinerary set at Nighthawk Cinema in
 * Williamsburg.
 */
+ (PORItinerary *) nighthawkCinemaAndCoffeeItinerary;
/**
 * Return a sample itinerary set on Roosevelt Island.
 */
+ (PORItinerary *) picnicOnRooseveltIslandItinerary;

@end
