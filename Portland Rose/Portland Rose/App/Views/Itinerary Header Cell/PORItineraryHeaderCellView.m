//
//  PORItineraryHeaderCellView.m
//  Portland Rose
//
//  Created by Hunter Ford on 18/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORItineraryHeaderCellView.h"

/// Display format for estimated cost range
static NSString * const FORMAT_COST = @"%lu to %lu";
/// Display format for estimated duration (in hours)
static NSString * const FORMAT_DURATION_HOURS = @"%lu hr";
/// Display format for estimated duration (in minutes)
static NSString * const FORMAT_DURATION_MINS = @"%lu min";
/// The name of the nib file to load
static NSString * const NAME_NIB = @"PORItineraryHeaderCellView";
/// The reuse identifier for this cell
static NSString * const REUSE_IDENTIFIER = @"ItineraryHeaderCell";
/// The display title for this cell
static NSString * const TITLE_CELL = @"Itinerary";

@interface PORItineraryHeaderCellView()

/// Subtitle label
@property (weak, nonatomic) IBOutlet UILabel *viewLabelSubtitle;
/// Title label
@property (weak, nonatomic) IBOutlet UILabel *viewLabelTitle;
/// Page control (the current index dots)
@property (weak, nonatomic) IBOutlet UIPageControl *viewPageControl;
/// Image carousel view
@property (weak, nonatomic) IBOutlet PORImageCarouselView *viewImageCarousel;
/// Labeled icon for the estimated duration
@property (weak, nonatomic) IBOutlet PORLabeledIconView *viewLabeledIconDuration;
/// Labeled icon for the estimated cost
@property (weak, nonatomic) IBOutlet PORLabeledIconView *viewLabeledIconCost;


@end

@implementation PORItineraryHeaderCellView

#pragma mark - lifecycle

- (void)awakeFromNib {
  [super awakeFromNib];
  [self setUp];
}

#pragma mark - setters

/**
 * `setItinerary:` is the setter for the `itinerary` property. This triggers a
 *  refresh of subviews.
 */
- (void) setItinerary:(PORItinerary *)itinerary{
  _itinerary = itinerary;
  [self refresh];
}

#pragma mark - helpers

/**
 * `refresh` refreshes subview properties.
 */
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
  
  // Update image carousel
  [_viewImageCarousel setImages: [_itinerary allImages]];
}

/**
 * `setUp` performs initial setup.
 */
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
  
  // Configure image carousel view
  [_viewImageCarousel setDelegate:self];
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

#pragma mark - <PORImageCarouselViewDelegate>

/**
 * Handle image carousel index changes.
 */
- (void)imageCarouselView:(PORImageCarouselView *)carouselView didChangeIndex:(NSUInteger)index{
  // Update the page control's `currentPage` index
  [_viewPageControl setCurrentPage: index];
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
