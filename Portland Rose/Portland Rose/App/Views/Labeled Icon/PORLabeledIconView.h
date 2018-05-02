//
//  PORLabeledIconView.h
//  Portland Rose
//
//  Created by Hunter Ford on 12/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PORPalette.h"
#import "PORTypeLibrary.h"

IB_DESIGNABLE

@interface PORLabeledIconView : UIView

/// The color of the text and the tint of the icon. Optional.
@property IBInspectable UIColor * color;
/// The text label's font. Optional.
@property UIFont * font;
/// The image icon to display.
@property IBInspectable UIImage * icon;
/// The spacing between the icon and its label.
@property IBInspectable CGFloat spacingStack;
/// The text to display.
@property (nonatomic) IBInspectable NSString * text;

@end
