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
@property IBInspectable BOOL interactive;
/// Text to display on the button (if any)
@property IBInspectable NSString * textButton;
/// Title text
@property IBInspectable NSString * title;
/// Subtitle text
@property IBInspectable NSString * subtitle;


@end






