//
//  PORItineraryHeaderCellView.m
//  Portland Rose
//
//  Created by Hunter Ford on 18/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORItineraryHeaderCellView.h"


static NSString * const FORMAT_COST = @"%lu to %lu";
static NSString * const FORMAT_DURATION_MINS = @"%lu min";
static NSString * const FORMAT_DURATION_HOURS = @"%lu hr";

static NSString * const NAME_NIB = @"PORItineraryHeaderCellView";
static NSString * const REUSE_IDENTIFIER = @"ItineraryHeaderCell";
static NSString * const TITLE_CELL = @"Itinerary";

@interface PORItineraryHeaderCellView()

@property (weak, nonatomic) IBOutlet UILabel *viewLabelSubtitle;
@property (weak, nonatomic) IBOutlet UILabel *viewLabelTitle;
@property (weak, nonatomic) IBOutlet UIView *viewWrapperImageCarousel;
@property (weak, nonatomic) IBOutlet UIPageControl *viewPageControl;
@property (weak, nonatomic) IBOutlet PORLabeledIconView *viewLabeledIconDuration;
@property (weak, nonatomic) IBOutlet PORLabeledIconView *viewLabeledIconCost;


@end

@implementation PORItineraryHeaderCellView

#pragma mark - lifecycle

- (void)awakeFromNib {
  [super awakeFromNib];
  [self setUp];
}

#pragma mark - setters

- (void) setItinerary:(PORItinerary *)itinerary{
  _itinerary = itinerary;
  [self refresh];
}

#pragma mark - helpers
- (void) refresh{
  NSAssert(_itinerary, @"Missing itinerary.");
  
  // Update title / subtitle
  [_viewLabelSubtitle setText: _itinerary.title];
  [_viewLabelTitle setText: TITLE_CELL];
  
  // Update cost / duration
  [_viewLabeledIconCost setText: [self formattedCost]];
  [_viewLabeledIconDuration setText: [self formattedDuration]];
  
  // Update page control
  if ([_itinerary.imagesSecondary count]){
    [_viewPageControl setNumberOfPages:[_itinerary.imagesSecondary count] + 1];
  } else {
    [_viewPageControl setNumberOfPages: 1];
  }

}

- (void) setUp{
  PORPalette * palette;
  PORTypeLibrary * typeLibrary;
  
  // Initialize type library and palette
  palette = [PORPalette sharedPalette];
  typeLibrary = [PORTypeLibrary sharedTypeLibrary];
  
  // Configure title / subtitle label fonts
  [_viewLabelSubtitle setFont: typeLibrary.fontSubtitle];
  [_viewLabelTitle setFont: typeLibrary.fontTitle];
  
  // Configure title / subtitle colors
  [_viewLabelSubtitle setTextColor: palette.colorText];
  [_viewLabelTitle setTextColor: palette.colorTextLoud];
  
  // Configure page control
  [_viewPageControl setCurrentPageIndicatorTintColor: palette.colorPrimary];
  [_viewPageControl setPageIndicatorTintColor:palette.colorTextMuted];
}

/**
 * Return a displayable text representation of this activity's estimated
 * cost range.
 */
- (NSString *) formattedCost {
  return [NSString stringWithFormat: FORMAT_COST, _itinerary.costLower, _itinerary.costUpper];
}

/**
 * Return a displayable text representation of this activity's estimated
 * duration range.
 */
- (NSString *) formattedDuration {
  if (_itinerary.duration > 60){
    return [NSString stringWithFormat:FORMAT_DURATION_HOURS, _itinerary.duration / 60];
  } else {
    return [NSString stringWithFormat:FORMAT_DURATION_MINS, _itinerary.duration];
  }
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
