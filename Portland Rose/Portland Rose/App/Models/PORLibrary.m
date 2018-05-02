//
//  PORLibrary.m
//  Portland Rose
//
//  Created by Hunter Ford on 02/05/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORLibrary.h"

@implementation PORLibrary

#pragma mark - lifecycle

+ (instancetype) sharedLibrary{
  static PORLibrary * sharedLibrary;
  static dispatch_once_t token;
  
  sharedLibrary = nil;
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

- (void) loadRecordBooks{
  self.itinerariesFeed = [[PORItinerariesFeed alloc]  init];
  self.itinerariesPinned = [[PORItinerariesPinned alloc]  init];
}

@end
