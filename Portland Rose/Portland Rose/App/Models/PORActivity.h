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

/// Minimum price estimate (dollars)
@property NSUInteger costLower;
/// Maximum price estimate (dollars)
@property NSUInteger costUpper;
/// Duration (minutes, lower estimate)
@property NSUInteger durationLower;
/// Duration (minutes, upper estimate)
@property NSUInteger durationUpper;
/// Activity icon
@property UIImage * icon;
/// Is a reservation required?
@property BOOL isReservationRequired;
/// Location
@property PORLocation * location;
/// Notes
@property NSString * notes;
/// Subtitle
@property NSString * subtitle;
/// Activity title
@property NSString * title;
/// Recommendations
@property NSString * recommendations;
/// Dress code
@property NSString * whatToWear;
/// Things to bring
@property NSString * whatToBring;

@end
