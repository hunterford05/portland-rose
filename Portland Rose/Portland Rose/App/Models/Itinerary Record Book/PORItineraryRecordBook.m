//
//  PORItineraryRecordBook.m
//  Portland Rose
//
//  Created by Hunter Ford on 01/05/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORItineraryRecordBook.h"

@implementation PORItineraryRecordBook

- (PORItineraries *)allItineraries{
  return (PORItineraries *)[super allRecords];
};

- (PORItinerary *) createItinerary:(PORItinerary *)itinerary{
  return (PORItinerary *)[super createRecord:itinerary];
}

- (PORItineraries *) createItineraries:(PORItinerary *)itineraries{
  return (PORItineraries *)[super createRecords:(PORRecords *)itineraries];
}

@end
