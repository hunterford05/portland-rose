//
//  PORLibrary.m
//  Portland Rose
//
//  Created by Hunter Ford on 02/05/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORLibrary.h"
#pragma warning MOCKS
#import "PORItinerary+Mocks.h"

@implementation PORLibrary

#pragma mark - lifecycle

+ (instancetype) sharedLibrary{
  static PORLibrary * sharedLibrary = nil;
  static dispatch_once_t token;
  
  dispatch_once(&token, ^{
    sharedLibrary = [[self alloc] init];
  });
  
  return sharedLibrary;
}

- (instancetype) init{
  self = [super init];
  if (self){
    [self loadRecordBooks];
  }
  
  return self;
}


#pragma mark - helpers

/**
 * Initialize the library's record books.
 */
- (void) loadRecordBooks{
  self.itinerariesFeed = [[PORRecordBook<PORItinerary *> alloc]  init];
  self.itinerariesPinned = [[PORRecordBook<PORItinerary *> alloc]  init];
#pragma warning MOCKS
  [self.itinerariesFeed createRecords:[PORItinerary mocks: 25]];
}

@end
