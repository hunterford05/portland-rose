//
//  PORRecordBook.m
//  Portland Rose
//
//  Created by Hunter Ford on 30/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORRecordBook.h"

typedef NSArray<PORRecord *> PORRecords;

@interface PORRecordBook()

/// Dictionary containing `PORRecord` instances; the keys are their `identifier`s
@property NSMutableDictionary <NSNumber *, PORRecord *> * ledger;

@end

@implementation PORRecordBook

#pragma mark - lifecycle

- (instancetype) init {
  self = [super init];
  if (self){
    _ledger = [[NSMutableDictionary <NSNumber *, PORRecord *> alloc] init];
  }
  return self;
}

#pragma mark - A.P.I.

- (PORRecords *)allRecords{
  PORRecords * a;
  a = _ledger ? _ledger.allValues : @[];
  return a;
}

- (PORRecord *) createRecord:(PORRecord *)record{
  [self insertRecord:record];
  return record;
}

- (PORRecords *) createRecords: (PORRecords *) records {
  [self insertRecords:records];
  return records;
}

- (PORRecord *) destroyRecordWithIdentifier: (NSUInteger) identifier{
  return [self removeRecordWithIdentifier:identifier];
}


#pragma mark - helpers

/**
 * Inserts `record` into the ledger, then informs this record book's
 * `delegate` (if any) that an update has occurred.
 */
- (void) insertRecord:(PORRecord *) record{
  [self.ledger setObject:record forKey:[NSNumber numberWithUnsignedInteger:record.identifier]];
  if (self.delegate){
    [self.delegate didUpdateRecordBook:self];
  }
}

/**
 * Inserts `records` into the ledger, then informs this record book's
 * `delegate` (if any) that an update has occurred.
 */
- (void) insertRecords:(PORRecords *) records{
  for (PORRecord * record in records){
    [self.ledger setObject:record forKey:[NSNumber numberWithUnsignedInteger:record.identifier]];
  }
  if (self.delegate){
    [self.delegate didUpdateRecordBook:self];
  }
}

- (PORRecord *) removeRecordWithIdentifier: (NSUInteger) identifier{
  NSNumber * key;
  PORRecord * record;
  
  key = [NSNumber numberWithUnsignedInteger:identifier];
  record = [self.ledger objectForKey:key];
  [self.ledger removeObjectForKey:key];
  [self.delegate didUpdateRecordBook:self];
  
  return record;
};



@end
