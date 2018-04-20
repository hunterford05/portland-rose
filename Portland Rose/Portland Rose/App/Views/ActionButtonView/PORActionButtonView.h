//
//  PORFloatingActionButtonView.h
//  Portland Rose
//
//  Created by Hunter Ford on 03/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE

@interface PORActionButtonView : UIControl

/// Color for text label
@property IBInspectable UIColor * colorLabel;
/// Color for background (gradient #1)
@property IBInspectable UIColor * colorBackgroundFirst;
/// Color for background (gradient #2)
@property IBInspectable UIColor * colorBackgroundSecond;
/// Text to display on the button
@property (nonatomic) IBInspectable NSString * text;
/// Main view
@property (strong, nonatomic) IBOutlet UIView *view;
/// Colored background view
@property (weak, nonatomic) IBOutlet UIView *viewBackground;
/// Text label
@property (weak, nonatomic) IBOutlet UILabel *viewLabelText;
/// Shadow view
@property (weak, nonatomic) IBOutlet UIView *viewShadow;

- (void) refresh;
- (void) nibDidLoad;

@end

