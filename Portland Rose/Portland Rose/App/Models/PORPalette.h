//
//  PORPalette.h
//  Portland Rose
//
//  Created by Hunter Ford on 03/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIColor+Hex.h"

@interface PORPalette : NSObject

/// Shared singleton `Palette` instance
+ (id) sharedPalette;

/// Default background color
@property UIColor * colorBackground;
/// Color for dividers
@property UIColor * colorDivider;
/// Primary color
@property UIColor * colorPrimary;
/// Secondary color
@property UIColor * colorSecondary;
/// Default text color
@property UIColor * colorText;
/// Inverted text color (for light backgrounds)
@property UIColor * colorTextInverted;
/// Loud (emphasized) text color
@property UIColor * colorTextLoud;

@end
