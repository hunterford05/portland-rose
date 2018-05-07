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
@class POREmptyStateView;

@protocol POREmptyStateViewDelegate

- (void)didSelectEmptyStateView:(POREmptyStateView *)emptyStateView;

@end

@interface POREmptyStateView : UIView

/// Display a button?
@property (nonatomic) IBInspectable BOOL actionable;
/// Delegate
@property id<POREmptyStateViewDelegate> delegate;
/// Title text
@property (nonatomic) IBInspectable NSString * headline;
/// Subtitle text
@property (nonatomic) IBInspectable NSString * subhead;
/// Text to display on the button (if any)
@property (nonatomic) IBInspectable NSString * textButton;


@end






