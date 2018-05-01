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
 * Initialize the singleton instance of this record book
 */
+ (instancetype) sharedRecordBook;

/**
 * Return an array containing all `PORRecord`s stored in this record book
 */
- (NSArray <PORRecord *> *) allRecords;

/**
 * Adds the provided `record` to this record book.  The `delegate` will
 * be informed of the update.
 */
- (PORRecord *) createRecord: (PORRecord *) record;

@end
