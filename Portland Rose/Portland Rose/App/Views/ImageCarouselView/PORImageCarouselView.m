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

@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIStackView *viewStack;
@property (weak, nonatomic) IBOutlet UIScrollView *viewScroll;

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

- (void) setImages:(NSArray<UIImage *> *)images{
  _images = images;
  [self clearImages];
  for (UIImage * image in _images){
    [self addImage:image];
  }
}

- (void) setIndex:(NSUInteger)index{
  _index = index;
  if (_delegate){
    [_delegate imageCarouselView:self didChangeIndex:_index];
  }
}

#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
  if (!decelerate){
    [self setIndex: [self calculateIndex]];
  }
}

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
  [self setIndex: [self calculateIndex]];
}

#pragma mark - helpers

- (NSUInteger) calculateIndex {
  CGFloat f;
  NSUInteger i;
  f = round(_viewScroll.contentOffset.x / _view.bounds.size.width);
  i = (NSUInteger)f;
  return i;
}

- (void) clearImages{
  for (UIView * view in _viewStack.arrangedSubviews){
    [view removeFromSuperview];
  }
}
                                    
- (void) addImage: (UIImage *) image{
  PORImageCardView * viewImage;
  
  viewImage = [[PORImageCardView alloc] init];
  [viewImage setImage:image];
  [_viewStack addArrangedSubview:viewImage];
  [[viewImage.heightAnchor constraintEqualToAnchor:viewImage.widthAnchor multiplier:1] setActive:YES];
  [[viewImage.widthAnchor constraintEqualToAnchor:_view.widthAnchor multiplier:1 constant:PADDING_HORIZONTAL * -2] setActive: YES];
}

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
