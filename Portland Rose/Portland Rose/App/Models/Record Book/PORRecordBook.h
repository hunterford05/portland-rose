//
//  PORRecordBook.h
//  Portland Rose
//
//  Created by Hunter Ford on 30/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORRecord.h"
#import <Foundation/Foundation.h>

@class PORRecordBook;

typedef NSArray <PORRecord *> PORRecords;

@protocol PORRecordBookDelegate
/**
 * Handle record book updates.
 */
- (void) didUpdateRecordBook:(PORRecordBook *)recordBook;
@end

@interface PORRecordBook : NSObject

/// The `delegate` is informed when: (1) new record(s) are added
@property id <PORRecordBookDelegate> delegate;


/**
 * Return an array containing all `PORRecord`s stored in this record book
 */
- (PORRecords *) allRecords;

/**
 * Adds the provided `record` to this record book.  The `delegate` will
 * be informed of the update.
 */
- (PORRecord *) createRecord: (PORRecord *) record;

/**
 * Adds the provided `records` to this record book.  The `delegate` will
 * be informed of the update.
 */
- (PORRecords *) createRecords: (PORRecords *) records;

/**
 * Removes the record with the given `identifier` from this record book.
 * the `delegate` will be informed of the update.
 */
- (PORRecord *) destroyRecordWithIdentifier: (NSUInteger) identifier;

@end
