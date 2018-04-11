//
//  PORItinerarySummaryView.m
//  Portland Rose
//
//  Created by Hunter Ford on 11/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORItinerarySummaryView.h"

/// NIB name
static NSString * const NAME_NIB = @"PORItinerarySummaryView";

@interface PORItinerarySummaryView()
/// Main view
@property (strong, nonatomic) IBOutlet UIView *view;
/// Itinerary image
@property (weak, nonatomic) IBOutlet PORImageCardView *viewCardImage;
/// Itinerary cost label
@property (weak, nonatomic) IBOutlet UILabel *viewLabelCost;
/// Itinerary duration label
@property (weak, nonatomic) IBOutlet UILabel *viewLabelDuration;
/// Itinerary title label
@property (weak, nonatomic) IBOutlet UILabel *viewLabelTitle;
/// Stack view showing itinerary summary icons, cost, etc.
@property (weak, nonatomic) IBOutlet UIStackView *viewStackDashboard;

@end

@implementation PORItinerarySummaryView

#pragma mark - lifecycle

- (instancetype) initWithFrame:(CGRect)frame{
  self = [super initWithFrame:frame];
  [self loadNib];
  return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder{
  self = [super initWithCoder:aDecoder];
  [self loadNib];
  return self;
}

#pragma mark - helpers

- (void) loadNib {
  [[NSBundle bundleForClass:self.class] loadNibNamed:NAME_NIB owner:self options:nil];
  [self nibDidLoad];
}

- (void) nibDidLoad {
  PORPalette * palette;
  PORTypeLibrary * typeLibrary;
  
  palette = [PORPalette sharedPalette];
  typeLibrary = [PORTypeLibrary sharedTypeLibrary];
  
  // Configure primary view
  _view.frame = self.bounds;
  [self addSubview: _view];
  
  // Configure label colors
  [_viewLabelTitle setTextColor: palette.colorTextLoud];
  [_viewLabelCost setTextColor: palette.colorText];
  [_viewLabelDuration setTextColor: palette.colorText];
  
  // Configure label fonts
  [_viewLabelTitle setFont: typeLibrary.fontHeadline];
  [_viewLabelCost setFont: typeLibrary.fontBody];
  [_viewLabelDuration setFont: typeLibrary.fontBody];
  
  // Configure icon tints
  for (UIView * v in _viewStackDashboard.arrangedSubviews) {
    v.tintColor = palette.colorText;
  }
  
}

@end
