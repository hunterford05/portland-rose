//
//  PORItineraryRecordBook.h
//  Portland Rose
//
//  Created by Hunter Ford on 01/05/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORItinerary.h"
#import "PORRecordBook.h"

@interface PORItineraryRecordBook : PORRecordBook

/**
 * Return array containing all itineraries stored here.
 */
- (NSArray <PORItinerary *> *) allItineraries;
/**
 * Add an itinerary to this record book.
 */
- (PORItinerary *)createItinerary:(PORItinerary *) itinerary;
/**
 * Add  itineraries to this record book.
 */
- (NSArray <PORItinerary *> *)createItineraries:(NSArray <PORItinerary *> *) itinerary;

@end
