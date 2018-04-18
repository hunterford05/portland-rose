//
//  PORActivity+Mocks.h
//  Portland Rose
//
//  Created by Hunter Ford on 13/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "NSNumber+Random.h"
#import "NSString+Random.h"
#import "PORActivity.h"


@interface PORActivity (Mocks)

#pragma mark - class

/**
 * Returns a randomly-generated `PORActivity` instance
 */
+ (PORActivity *) mock;

/**
 * Returns a list of `n` randomly-generated `PORActivity` instances
 */
+ (NSArray <PORActivity *> *) mocks: (NSUInteger) n;

#pragma mark - instance

/**
 * Returns a random lower bound estimate for the activity's cost
 * (in dollars)
 */
- (NSUInteger) getRandomCostLower;
/**
 * Returns a random upper bound estimate for the activity's cost
 * (in dollars)
 */
- (NSUInteger) getRandomCostUpper;
/**
 * Returns a random activity description
 */
- (NSString *) getRandomDescription;
/**
 * Returns a random lower bound estimate for the activity's cost
 * (in minutes)
 */
- (NSUInteger) getRandomDurationLower;
/**
 * Returns a random upper bound estimate for the activity's duration
 * (in minutes)
 */
- (NSUInteger) getRandomDurationUpper;
/**
 * Returns a random activity icon
 */
- (UIImage *) getRandomIcon;
/**
 * Returns a random reservation requirement flag
 */
- (BOOL) getRandomIsReservationRequired;
/**
 * Returns a random activity location
 */
- (PORLocation *) getRandomLocation;
/**
 * Returns a random notes attribute
 */
- (NSString *) getRandomNotes;
/**
 * Returns a random recommendations for the activity
 */
- (NSString *) getRandomRecommendations;
/**
 * Returns a random title for the activity
 */
- (NSString *) getRandomTitle;
/**
 * Returns a random description of what items to bring
 */
- (NSString *) getRandomWhatToBring;
/**
 * Returns a random description of what to wear
 */
- (NSString *) getRandomWhatToWear;


@end
