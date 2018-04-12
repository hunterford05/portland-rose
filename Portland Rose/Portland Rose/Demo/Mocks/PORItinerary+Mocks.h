//
//  PORItinerary+Mocks.h
//  Portland Rose
//
//  Created by Hunter Ford on 12/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORBadge+Mocks.h"
#import "PORItinerary.h"
#import "NSNumber+Random.h"
#import "NSString+Random.h"

@interface PORItinerary(Mocks)

/**
 * Returns a single itinerary mock
 */
+ (PORItinerary *) mock;

/**
 * Returns `n` itinerary mocks
 */
+ (NSArray *) mocks: (NSUInteger) n;

#pragma mark - helpers

/**
 * Returns a random lower cost estimate
 */
- (NSUInteger) getRandomCostLower;

/**
 * Returns a random upper cost estimate
 */
- (NSUInteger) getRandomCostUpper;

/**
 * Returns a random itinerary duration
 */
- (NSUInteger) getRandomDuration;

/**
 * Returns a random itinerary image
 */
- (UIImage *) getRandomImage;

/**
 * Returns a random itinerary main image
 */
- (UIImage *) getRandomMainImage;

/**
 * Returns a random itinerary title
 */
- (NSString *) getRandomTitle;

@end
