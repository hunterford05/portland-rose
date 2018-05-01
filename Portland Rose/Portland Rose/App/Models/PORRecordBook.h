//
//  PORRecordBook.h
//  Portland Rose
//
//  Created by Hunter Ford on 30/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORRecord.h"
#import <Foundation/Foundation.h>

@interface PORRecordBook : NSObject

+ (instancetype) sharedRecordBook;

- (PORRecord *) findRecordById: (NSNumber *) id;
- (NSArray <PORRecord *> *) allRecords;
- (PORRecord *) saveRecord: (PORRecord *) record;
- (PORRecord *) createRecord: (PORRecord *) record;
- (PORRecord *) updateRecord: (PORRecord *) record;
- (PORRecord *) destroyRecord: (PORRecord *) record;

@end
