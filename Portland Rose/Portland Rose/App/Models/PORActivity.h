//
//  PORActivity.h
//  Portland Rose
//
//  Created by Hunter Ford on 10/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PORActivity : NSObject

/// Activity title
@property NSString * title;
/// Minimum price estimate (cents)
@property NSUInteger amountMin;
/// Maximum price estimate (cents)
@property NSUInteger amountMax;

@end
