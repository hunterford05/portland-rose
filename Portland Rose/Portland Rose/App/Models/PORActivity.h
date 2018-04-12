//
//  PORActivity.h
//  Portland Rose
//
//  Created by Hunter Ford on 10/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PORLocation.h"
#import <UIKit/UIKit.h>

@interface PORActivity : NSObject

/// Minimum price estimate (cents)
@property NSUInteger amountMin;
/// Maximum price estimate (cents)
@property NSUInteger amountMax;
/// Activity icon
@property UIImage * icon;
/// Activity title
@property NSString * title;
/// Location
@property PORLocation * location;

@end
