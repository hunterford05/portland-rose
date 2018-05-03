//
//  PORBadge+Mocks.h
//  Portland Rose
//
//  Created by Hunter Ford on 12/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "NSString+Random.h"
#import "PORBadge.h"


@interface PORBadge (Mocks)

/**
 * Returns a `PORBadge` mock
 */
+ (PORBadge *) mock;

/**
 * Returns a list of `n` `PORBadge` mocks
 */
+ (NSArray <PORBadge *> *) mocks: (NSUInteger) n;

#pragma mark - helpers

/**
 * Returns a random badge title
 */
- (NSString *) getRandomTitle;

/**
 * Returns a random badge icon
 */
- (UIImage *) getRandomIcon;


@end
