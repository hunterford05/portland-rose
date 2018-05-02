//
//  PORItineraryFeedRecordBook.m
//  Portland Rose
//
//  Created by Hunter Ford on 01/05/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//
#pragma warning MOCKS
#import "PORItinerary+Mocks.h"
#import "PORItineraryFeedRecordBook.h"

@implementation PORItineraryFeedRecordBook

- (instancetype) init{
  self = [super init];
  if (self){
#pragma warning MOCKS
    [self createItineraries:[PORItinerary mocks:25]];
  }
  return self;
}

@end
