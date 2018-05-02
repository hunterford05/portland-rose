//
//  PORLibrary.h
//  Portland Rose
//
//  Created by Hunter Ford on 02/05/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORItinerariesFeed.h"
#import "PORItinerariesPinned.h"
#import <Foundation/Foundation.h>

@interface PORLibrary : NSObject

@property PORItinerariesFeed * itinerariesFeed;
@property PORItinerariesPinned * itinerariesPinned;

+ (instancetype) sharedLibrary;

@end
