//
//  POREmptyStateView.h
//  Portland Rose
//
//  Created by Hunter Ford on 07/05/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORActionButtonView.h"
#import "PORPalette.h"
#import "PORTypeLibrary.h"
#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface POREmptyStateView : UIView

/// Display a button?
@property IBInspectable BOOL actionable;
/// Title text
@property IBInspectable NSString * headline;
/// Subtitle text
@property IBInspectable NSString * subhead;
/// Text to display on the button (if any)
@property IBInspectable NSString * textButton;


@end






