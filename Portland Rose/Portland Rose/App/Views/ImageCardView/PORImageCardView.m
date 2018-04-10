//
//  PORImageCardView.m
//  Portland Rose
//
//  Created by Hunter Ford on 06/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORImageCardView.h"

/// Name of NIB file
static NSString * const NAME_NIB = @"PORImageCardView";
/// Default blur vertical offset
static CGFloat const OFFSET_Y_BLUR = 10.0;
/// Default blur radius
static CGFloat const RADIUS_BLUR = 50.0;
/// Default image card corner radius
static CGFloat const RADIUS_CORNER = 10.0;

@interface PORImageCardView()

/// Constraint for the blur's vertical position (offset)
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintBlurCenterY;
/// Constraint for the blur's width (radius)
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintBlurWidth;
/// Main view
@property (strong, nonatomic) IBOutlet UIView *view;
/// UIVisualEffectView for blurring the shadow image
@property (weak, nonatomic) IBOutlet UIVisualEffectView *viewBlur;
/// The displayed image
@property (weak, nonatomic) IBOutlet UIImageView *viewImage;
/// The shadow image, which is blurred behind a UIVisualEffectView
@property (weak, nonatomic) IBOutlet UIImageView *viewShadowImage;

@end

@implementation PORImageCardView

#pragma mark - lifecycle

- (instancetype) initWithCoder:(NSCoder *)aDecoder{
  self = [super initWithCoder:aDecoder];
  if (self) {
    [self loadNib];
  }
  return self;
}

- (instancetype) initWithFrame:(CGRect)frame {
  self = [super initWithFrame: frame];
  if (self){
    [self loadNib];
  }
  return self;
}

- (void)drawRect:(CGRect)rect{
  [self updateBlur];
  [super drawRect:rect];
}

#pragma mark - getters / setters

- (void) setRadiusBlur:(CGFloat)radiusBlur {
  _radiusBlur = radiusBlur;
  _constraintBlurWidth.constant = _radiusBlur;
  [self setNeedsLayout];
}

- (void) setOffsetYBlur:(CGFloat)offsetYBlur {
  _offsetYBlur = offsetYBlur;
  _constraintBlurCenterY.constant = _offsetYBlur;
  [self setNeedsLayout];
}

- (void) setRadiusCorner:(CGFloat)radiusCorner{
  _radiusCorner = radiusCorner;
  _viewImage.layer.cornerRadius = _radiusCorner;
  _viewShadowImage.layer.cornerRadius = _radiusCorner;
  [self setNeedsDisplay];
}

- (void) setImage:(UIImage *)image {
  _image = image;
  [_viewImage setImage:image];
  [_viewShadowImage setImage: image];
  [self setNeedsDisplay];
}

# pragma mark - helpers

/**
 * Load the main view from a NIB file and add it as a subview
 */
- (void) loadNib {
  [[NSBundle bundleForClass:self.class] loadNibNamed:NAME_NIB owner:self options:nil];
  [_view setFrame: self.bounds];
  [self addSubview: _view];
  [self nibDidLoad];
}

/**
 * Configure subviews. Called after the NIB loads.
 */
- (void) nibDidLoad {
  [self setRadiusBlur: RADIUS_BLUR];
  [self setOffsetYBlur: OFFSET_Y_BLUR];
  [self setRadiusCorner: RADIUS_CORNER];
}


/**
 * Configure blur effect view
 */
- (void) updateBlur {
  
  // mask opacity
  CGFloat a;
  /// mask corner radius
  CGFloat cr;
  /// mask layer
  CALayer * maskLayer;
  /// mask inset
  CGFloat i;
  /// mask blur radius
  CGFloat r;
  
  a = 0.84;
  r = 10;
  i = r * 1.5;
  cr = 10;
  maskLayer = [CALayer layer];
  maskLayer.frame = _viewBlur.bounds;
  maskLayer.shadowRadius = r;
  maskLayer.shadowPath = CGPathCreateWithRoundedRect(CGRectInset(_viewBlur.bounds, i, i), cr, cr, nil);
  maskLayer.shadowOpacity = a;
  maskLayer.shadowOffset = CGSizeZero;
  maskLayer.shadowColor = [UIColor whiteColor].CGColor;
  _viewBlur.layer.mask = maskLayer;
}

@end
