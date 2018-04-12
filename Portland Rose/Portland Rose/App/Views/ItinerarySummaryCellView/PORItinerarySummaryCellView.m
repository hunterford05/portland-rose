//
//  PORItinerarySummaryCellView.m
//  Portland Rose
//
//  Created by Hunter Ford on 11/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORItinerarySummaryCellView.h"

@interface PORItinerarySummaryCellView()

@end

@implementation PORItinerarySummaryCellView

#pragma mark - lifecycle

- (void)awakeFromNib {
  [super awakeFromNib];
  [self setUp];
}

- (void)prepareForInterfaceBuilder{
  [super prepareForInterfaceBuilder];
  [self setUp];
  [self.contentView layoutSubviews];
}

- (void) layoutSubviews{
  [super layoutSubviews];
  // Update the itinerary summary view's frame
  [_viewItinerarySummary setFrame:self.contentView.bounds];
}

#pragma mark - events

- (void) touchUpInsideShowItineraryButton: (id) sender {
  if (_delegate){
    [_delegate didSelectItineraryAtIndex:_index];
  }
}

#pragma mark - helpers

/**
 * Perform initial setup
 */
- (void) setUp {
  // Initialize itinerary summary view
  _viewItinerarySummary = [[PORItinerarySummaryView alloc] initWithFrame: self.contentView.bounds];
  // Add button target / action
  [_viewItinerarySummary.viewButtonShowItinerary addTarget:self action:@selector(touchUpInsideShowItineraryButton:) forControlEvents:UIControlEventTouchUpInside];
  // Lay out the itinerary summary view
  [_viewItinerarySummary layoutSubviews];
  // Add the itinerary summary view as a subview
  [self.contentView addSubview:_viewItinerarySummary];
  [self setUpConstraints];
}

/**
 * Set up constraints. The cell should grow / shrink to match the size of its
 * itinerary summary view.
 */
- (void) setUpConstraints {
  NSLayoutConstraint * bottom;
  UIView * c;
  UIView * i;
  NSLayoutConstraint * leading;
  NSLayoutConstraint * top;
  NSLayoutConstraint * trailing;

  i = (UIView *) _viewItinerarySummary;
  c = self.contentView;
  
  bottom = [NSLayoutConstraint constraintWithItem: i attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:c attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
  leading = [NSLayoutConstraint constraintWithItem: i attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:c attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
  top = [NSLayoutConstraint constraintWithItem: i attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: c attribute:NSLayoutAttributeTop multiplier:1 constant:0];
  trailing = [NSLayoutConstraint constraintWithItem: i attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: c attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
  
  [c addConstraint:bottom];
  [c addConstraint:leading];
  [c addConstraint:top];
  [c addConstraint:trailing];
}

@end
