//
//  PORItineraries.m
//  Portland Rose
//
//  Created by Hunter Ford on 01/05/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORItineraries.h"

@implementation PORItineraries

- (NSArray<PORItinerary *> *)allItineraries{
  return (NSArray<PORItinerary *> *)[super allRecords];
};

- (PORItinerary *) createItinerary:(PORItinerary *)itinerary{
  return (PORItinerary *)[super createRecord:itinerary];
}

- (NSArray <PORItinerary *> *) createItineraries:(PORItinerary *)itineraries{
  return (NSArray <PORItinerary *> *)[super createRecords:(NSArray <PORRecord *> *)itineraries];
}

@end
