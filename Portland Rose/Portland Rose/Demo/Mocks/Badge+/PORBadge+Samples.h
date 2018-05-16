//
//  PORBadge+Samples.h
//  Portland Rose
//
//  Created by Hunter Ford on 16/05/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORBadge.h"

@interface PORBadge (Samples)

/**
 * Return a badge for cocktail itineraries.
 */
+ (PORBadge *) cocktailBadge;
/**
 * Return a badge for coffee itineraries.
 */
+ (PORBadge *) coffeeBadge;
/**
 * Return a badge for food itineraries.
 */
+ (PORBadge *) foodBadge;
/**
 * Return a badge for nocturnal itineraries.
 */
+ (PORBadge *) moonBadge;
/**
 * Return a badge for movie itineraries.
 */
+ (PORBadge *) movieBadge;
/**
 * Return a badge for scenic itineraries.
 */
+ (PORBadge *) scenicBadge;

@end
