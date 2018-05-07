//
//  PORLibrary.h
//  Portland Rose
//
//  Created by Hunter Ford on 02/05/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORItinerary.h"
#import "PORRecordBook.h"
#import <Foundation/Foundation.h>

@interface PORLibrary : NSObject

/// A record book containing itineraries in the user's feed
@property PORRecordBook<PORItinerary *> * itinerariesFeed;
/// A record book containing itineraries that the user has pinned
@property PORRecordBook<PORItinerary *> * itinerariesPinned;

/// Singleton library instance
+ (instancetype) sharedLibrary;

@end
