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
- (void) didUpdateRecordBook:(PORRecordBook *)recordBook;
@end

@interface PORRecordBook : NSObject

@property id <PORRecordBookDelegate> delegate;

+ (instancetype) sharedRecordBook;

- (NSArray <PORRecord *> *) allRecords;
- (PORRecord *) createRecord: (PORRecord *) record;

@end
