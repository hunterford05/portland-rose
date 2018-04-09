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

static CGFloat const RADIUS_BLUR = 50.0;
static CGFloat const OFFSET_Y_BLUR = 10.0;
static CGFloat const RADIUS_CORNER = 10.0;

@interface PORImageCardView()

@property (weak, nonatomic) IBOutlet UIImageView *viewImage;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIImageView *viewShadowImage;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *viewBlur;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintBlurCenterY;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintBlurWidth;

@end

@implementation PORImageCardView

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

- (void) loadNib {
  [[NSBundle bundleForClass:self.class] loadNibNamed:NAME_NIB owner:self options:nil];
  [_view setFrame: self.bounds];
  [self addSubview: _view];
  [self nibDidLoad];
}

- (void) nibDidLoad {
  [self setRadiusBlur: RADIUS_BLUR];
  [self setOffsetYBlur: OFFSET_Y_BLUR];
  [self setRadiusCorner: RADIUS_CORNER];
}

- (void)drawRect:(CGRect)rect{
  [self updateBlur];
  [super drawRect:rect];
}

/// Configure blur effect view
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
