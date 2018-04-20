//
//  PORImageCarouselView.m
//  Portland Rose
//
//  Created by Hunter Ford on 18/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORImageCarouselView.h"

static NSString * const NAME_NIB = @"PORImageCarouselView";
static CGFloat const PADDING_HORIZONTAL = 32.0;

@interface PORImageCarouselView()

/// Main view
@property (strong, nonatomic) IBOutlet UIView *view;
/// Scroll view that contains stack view and all image cards
@property (weak, nonatomic) IBOutlet UIScrollView *viewScroll;
/// Stack view embedded in the scroll view; contains image cards
@property (weak, nonatomic) IBOutlet UIStackView *viewStack;

@end

@implementation PORImageCarouselView

#pragma mark - lifecycle

- (instancetype) initWithCoder:(NSCoder *)aDecoder{
  if (self = [super initWithCoder:aDecoder]){
    [self loadNib];
  }
  return self;
}

- (instancetype) initWithFrame:(CGRect)frame{
  if (self = [super initWithFrame:frame]){
    [self loadNib];
  }
  return self;
}

#pragma mark - setters

/**
 * Setter for `images` property. Removes `PORImageCard` subviews before
 * generating new ones for each `UIImage *` in `images` and adding them
 * to the stack view.
 */
- (void) setImages:(NSArray<UIImage *> *)images{
  _images = images;
  [self clearImages];
  for (UIImage * image in _images){
    [self addImage:image];
  }
}

/**
 * Updates the `index` property and notifies the `delegate`.
 */
- (void) setIndex:(NSUInteger)index{
  _index = index;
  if (_delegate){
    [_delegate imageCarouselView:self didChangeIndex:_index];
  }
}

#pragma mark - <UIScrollViewDelegate>

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
  [self setIndex: [self calculateIndex]];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
  if (!decelerate){
    [self setIndex: [self calculateIndex]];
  }
}

#pragma mark - helpers

/**
 * `addImage:` generates a `PORImageCardView` instance with the given `image`
 * and adds it to the stack view.
 */
- (void) addImage: (UIImage *) image{
  PORImageCardView * viewImage;
  
  viewImage = [[PORImageCardView alloc] init];
  [viewImage setImage:image];
  [_viewStack addArrangedSubview:viewImage];
  [[viewImage.heightAnchor constraintEqualToAnchor:viewImage.widthAnchor multiplier:1] setActive:YES];
  [[viewImage.widthAnchor constraintEqualToAnchor:_view.widthAnchor multiplier:1 constant:PADDING_HORIZONTAL * -2] setActive: YES];
}

/**
 * Calculate the index of the current image card based on the content offset.
 */
- (NSUInteger) calculateIndex {
  CGFloat f;
  NSUInteger i;
  f = round(_viewScroll.contentOffset.x / _view.bounds.size.width);
  i = (NSUInteger)f;
  return i;
}

/**
 * `clearImages` removes all arranged subviews from the stack view.
 */
- (void) clearImages{
  for (UIView * view in _viewStack.arrangedSubviews){
    [view removeFromSuperview];
  }
}

/**
 * Load the nib file associated with this view, then call `nibDidLoad`.
 */
- (void) loadNib {
  [[NSBundle bundleForClass:self.class] loadNibNamed:NAME_NIB owner:self options:nil];
  [_view setFrame: self.bounds];
  [self addSubview: _view];
  [self nibDidLoad];
}

/**
 * Initial setup. Called after the NIB loads.
 */
- (void) nibDidLoad {
  // Set initial index property
  _index = 0;
  
  // Configure scroll view delegate
  [_viewScroll setDelegate:self];
  
  // Set background color
  [self setBackgroundColor:UIColor.clearColor];
}

@end
