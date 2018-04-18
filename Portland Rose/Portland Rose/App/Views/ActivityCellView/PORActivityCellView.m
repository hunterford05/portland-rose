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

/// Label for displaying the activity title
@property (weak, nonatomic) IBOutlet UILabel *viewLabelTitle;
/// Label for displaying the activity description (subtitle)
@property (weak, nonatomic) IBOutlet UILabel *viewLabelDescription;
/// Image view for displaying the activity icon
@property (weak, nonatomic) IBOutlet UIImageView *viewImageIcon;
/// Labeled icon for the activity's expected cost
@property (weak, nonatomic) IBOutlet PORLabeledIconView *viewLabeledIconCost;
/// Labeled icon for the activity's expected duration
@property (weak, nonatomic) IBOutlet PORLabeledIconView *viewLabeledIconDuration;
/// Labeled icon for the activity's reservation status (is a reservation needed?)
@property (weak, nonatomic) IBOutlet PORLabeledIconView *viewLabeledIconIsReservationRequired;
/// Labeled icon for the activity's reservation location
@property (weak, nonatomic) IBOutlet PORLabeledIconView *viewLabeledIconLocation;
/// Labeled icon for the activity's notes
@property (weak, nonatomic) IBOutlet PORLabeledIconView *viewLabeledIconNotes;
/// Labeled icon for the activity's recommendations
@property (weak, nonatomic) IBOutlet PORLabeledIconView *viewLabeledIconRecommendations;
/// Labeled icon for the activity's packing list
@property (weak, nonatomic) IBOutlet PORLabeledIconView *viewLabeledIconWhatToBring;
/// Labeled icon for the activity's dress code
@property (weak, nonatomic) IBOutlet PORLabeledIconView *viewLabeledIconWhatToWear;

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

/**
 * Update subviews.
 */
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

/**
 * Return a displayable text representation of this activity's estimated
 * cost range.
 */
- (NSString *) formattedCost {
  return [NSString stringWithFormat: FORMAT_COST, _activity.costLower, _activity.costUpper];
}

/**
 * Return a displayable text representation of this activity's estimated
 * duration range.
 */
- (NSString *) formattedDuration {
  if (_activity.durationLower > 60){
    return [NSString stringWithFormat:FORMAT_DURATION_HOURS, _activity.durationLower / 60, _activity.durationUpper / 60];
  } else {
    return [NSString stringWithFormat:FORMAT_DURATION_MINS, _activity.durationLower, _activity.durationUpper];
  }
}

/**
 * Perform initial setup and styling.
 */
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

/**
 * The name of the NIB file associated with this class.
 */
+ (NSString *) nibName {
  return NAME_NIB;
}

/**
 * The name of the reuse identifier associated with this class.
 */
+ (NSString *) reuseIdentifier {
  return REUSE_IDENTIFIER;
}

@end
