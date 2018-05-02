//
//  PORRecordBook.m
//  Portland Rose
//
//  Created by Hunter Ford on 30/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORRecordBook.h"

typedef NSMutableDictionary <NSNumber *, PORRecord *> PORLedger;

@interface PORRecordBook()

/// Dictionary containing `PORRecord` instances; the keys are their `identifier`s
@property PORLedger * ledger;

@end

@implementation PORRecordBook

#pragma mark - lifecycle

+ (instancetype) sharedRecordBook {
  static PORRecordBook * sharedRecordBook = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedRecordBook = [[self alloc] init];
  });
  return sharedRecordBook;
}

- (instancetype) init {
  self = [super init];
  if (self){
    _ledger = [[PORLedger alloc] init];
  }
  return self;
}

#pragma mark - A.P.I.

- (NSArray<PORRecord *> *)allRecords{
  NSArray <PORRecord *> * a;
  a = _ledger ? _ledger.allValues : @[];
  return a;
}

- (PORRecord *) createRecord:(PORRecord *)record{
  [self insertRecord:record];
  return record;
}

- (NSArray <PORRecord *> *) createRecords: (NSArray <PORRecord *> *) records {
  [self insertRecords:records];
  return records;
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
- (void) insertRecords:(NSArray <PORRecord *> *) records{
  for (PORRecord * record in records){
    [self.ledger setObject:record forKey:[NSNumber numberWithUnsignedInteger:record.identifier]];
  }
  if (self.delegate){
    [self.delegate didUpdateRecordBook:self];
  }
}

@end
