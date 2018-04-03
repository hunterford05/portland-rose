//
//  Palette.h
//  Portland Rose
//
//  Created by Hunter Ford on 03/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIColor+Hex.h"

@interface Palette : NSObject

/// Shared singleton `Palette` instance
+ (id) sharedPalette;

/// Default background color
@property UIColor * colorBackground;
/// Primary color
@property UIColor * colorPrimary;
/// Secondary color
@property UIColor * colorSecondary;
/// Default text color
@property UIColor * colorText;
/// Loud (emphasized) text color
@property UIColor * colorTextLoud;

@end
