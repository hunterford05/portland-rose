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

+ (instancetype) sharedInstance {
  static PORRecordBook * sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [[self alloc] init];
  });
  return sharedInstance;
}

- (instancetype) init {
  self = [super init];
  if (self){
    _ledger = [[PORLedger alloc] init];
  }
  return self;
}

@end
