//
//  PORActivityCellView.m
//  Portland Rose
//
//  Created by Hunter Ford on 12/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORActivityCellView.h"

/// Format for displayed cost
static NSString * const FORMAT_COST = @"%lu to %lu";
/// Format for displayed duration (hours)
static NSString * const FORMAT_DURATION_HOURS = @"%lu - %lu hours";
/// Format for displayed duration (mins)
static NSString * const FORMAT_DURATION_MINS = @"%lu — %lu mins";;
/// Nib filename
static NSString * const NAME_NIB = @"PORActivityCellView";
/// Reuse identifier
static NSString * const REUSE_IDENTIFIER = @"ActivityCell";

@interface PORActivityCellView()

@property (weak, nonatomic) IBOutlet UILabel *viewLabelTitle;
@property (weak, nonatomic) IBOutlet UILabel *viewLabelDescription;
@property (weak, nonatomic) IBOutlet UIImageView *viewImageIcon;
@property (weak, nonatomic) IBOutlet PORLabeledIconView *viewLabeledIconCost;
@property (weak, nonatomic) IBOutlet PORLabeledIconView *viewLabeledIconDuration;
@property (weak, nonatomic) IBOutlet PORLabeledIconView *viewLabeledIconLocation;
@property (weak, nonatomic) IBOutlet PORLabeledIconView *viewLabeledIconWhatToWear;
@property (weak, nonatomic) IBOutlet PORLabeledIconView *viewLabeledIconWhatToBring;
@property (weak, nonatomic) IBOutlet PORLabeledIconView *viewLabeledIconRecommendations;
@property (weak, nonatomic) IBOutlet PORLabeledIconView *viewLabeledIconNotes;
@property (weak, nonatomic) IBOutlet PORLabeledIconView *viewLabeledIconIsReservationRequired;


@end

@implementation PORActivityCellView

- (void)awakeFromNib {
  [super awakeFromNib];
  [self setUp];
  [self refresh];
}

- (void) layoutSubviews{
  [super layoutSubviews];
}

#pragma mark - setters

- (void)setActivity:(PORActivity *)activity{
  _activity = activity;
  [self refresh];
}

#pragma mark - helpers

- (void) refresh {
  // Configure icon, title, and subtitle
  [_viewLabelTitle setText: _activity.title];
  [_viewLabelDescription setText: _activity.subtitle];
  [_viewImageIcon setImage: _activity.icon];
  
  // Configure labeled icons
  [_viewLabeledIconRecommendations setText: _activity.recommendations];
  [_viewLabeledIconLocation setText: _activity.location.title];
  [_viewLabeledIconWhatToWear setText: _activity.whatToWear];
  [_viewLabeledIconWhatToBring setText: _activity.whatToBring];
  [_viewLabeledIconNotes setText: _activity.notes];
  [_viewLabeledIconCost setText: [self formattedCost]];
  [_viewLabeledIconDuration setText: [self formattedDuration]];
}

- (NSString *) formattedCost {
  return [NSString stringWithFormat: FORMAT_COST, _activity.costLower, _activity.costUpper];
}

- (NSString *) formattedDuration {
  if (_activity.durationLower > 60){
    return [NSString stringWithFormat:FORMAT_DURATION_HOURS, _activity.durationLower / 60, _activity.durationUpper / 60];
  } else {
    return [NSString stringWithFormat:FORMAT_DURATION_MINS, _activity.durationLower, _activity.durationUpper];
  }
}

- (void) setUp{
  PORPalette * palette;
  PORTypeLibrary * typeLibrary;
  
  palette = [PORPalette sharedPalette];
  typeLibrary = [PORTypeLibrary sharedTypeLibrary];
  
  // Configure label colors
  [_viewLabelTitle setTextColor: palette.colorTextLoud];
  [_viewLabelDescription setTextColor: palette.colorText];
  
  // Configure label fonts
  [_viewLabelTitle setFont: typeLibrary.fontHeadline];
  [_viewLabelDescription setFont: typeLibrary.fontBody];
  
  // Configure icon tints
  [_viewImageIcon setTintColor: palette.colorTextLoud];
  
}

#pragma mark - class

+ (NSString *) nibName {
  return NAME_NIB;
}

+ (NSString *) reuseIdentifier {
  return REUSE_IDENTIFIER;
}

@end
