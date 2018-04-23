//
//  PORRecord.h
//  Portland Rose
//
//  Created by Hunter Ford on 23/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PORRecord : NSObject

#pragma mark - static
/**
 * Returns an `NSArray` containing all saved instances of
 * this record.
 */
+ (NSArray <PORRecord *> *) all;
/**
 * Instantiates a new instance of this record with the given
 * `properties`. *The new instance is NOT saved.*
 */
+ (PORRecord *) build: (NSDictionary *) properties;
/**
 * Returns the number of unique instances of this record
 * that have been saved.
 */
+ (NSUInteger) count;
/**
 * Creates a new instance of this record with the given
 * `properties` and saves it.
 */
+ (PORRecord *) create: (NSDictionary *) properties;
/**
 * Returns the saved instance of this record with the given
 * `identifier`, or `<nil>` if no instance was found
 */
+ (PORRecord *) find: (NSUInteger) identifier;
/**
 * Returns the first saved instance of this record with the
 * given `properties`, or `<nil>` if no such saved
 * record exists.
 */
+ (PORRecord *) findBy: (NSDictionary *) properties;

#pragma mark - instance
/**
 * Instance identifier. Must be unique among all saved
 * instances of this record.
 */
@property NSUInteger identifier;

/**
 * Remove this record from persistent memory.
 */
- (PORRecord *) destroy;
/**
 * Returns true if this record's properties are valid.
 */
- (BOOL) isValid;
/**
 * Save this record instance. Returns the saved instance
 * if successful, otherwise it returns `<nil>`.
 */
- (PORRecord *) save;
/**
 * Update the given `properties` and then `save`. Returns
 * the updated instance if successful, otherwise returns
 * `<nil>` 
 */
- (PORRecord *) update: (NSDictionary *) properties;

@end
