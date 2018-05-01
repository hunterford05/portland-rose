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

@property PORLedger * ledger;

@end

@implementation PORRecordBook

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

- (PORRecord *) createRecord:(PORRecord *)record{
  [self.ledger setObject:record forKey:[NSNumber numberWithUnsignedInteger:record.identifier]];
  return record;
}

- (NSArray<PORRecord *> *)allRecords{
  NSArray <PORRecord *> * a;
  a = _ledger ? _ledger.allValues : @[];
  return a;
}

@end
