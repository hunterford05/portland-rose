//
//  NSString+Random.h
//  Portland Rose
//
//  Created by Hunter Ford on 12/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Random)

/**
 * Splits the string into substrings with the given delimeter, then
 * returns a random substring.
 */
- (NSString *) getRandomComponentDelimtedBy: (NSString *) delimeter;

/**
 * Splits the string into substrings with commas, then
 * returns a random substring.
 */
- (NSString *) getRandomComponentDelimtedByCommas;


@end
