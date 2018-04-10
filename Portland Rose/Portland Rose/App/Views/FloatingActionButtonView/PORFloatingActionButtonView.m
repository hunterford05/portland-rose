//
//  PORFloatingActionButtonView.m
//  Portland Rose
//
//  Created by Hunter Ford on 03/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORFloatingActionButtonView.h"
#import "PORPalette.h"
#import "PORTypeLibrary.h"

/// Name of XIB file
static NSString * const NAME_NIB = @"PORFloatingActionButtonView";
/// Opacity of the button's shadow
static CGFloat const OPACITY_SHADOW = 0.59;
/// Offset (horizontal and vertical) of the button's shadow
static CGFloat const OFFSET_SHADOW = 3.0;
/// Opacity for button background on touch event
static CGFloat const OPACITY_BACKGROUND_ON_TOUCH = 0.92;
/// Radius of the button's shadow
static CGFloat const RADIUS_SHADOW = 12.0;

static CGFloat const RADIUS = 32.0;

@interface PORFloatingActionButtonView()

@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIView *viewBackground;
@property (weak, nonatomic) IBOutlet UIImageView *viewImage;
@property (weak, nonatomic) IBOutlet UIView *viewShadow;

@end

@implementation PORFloatingActionButtonView

#pragma mark - lifecycle

- (instancetype) initWithCoder:(NSCoder *)aDecoder{
  self = [super initWithCoder:aDecoder];
  if (self) {
    [self loadNib];
  }
  return self;
}

- (instancetype) initWithFrame:(CGRect)frame{
  self = [super initWithFrame: frame];
  if (self){
    [self loadNib];
  }
  return self;
}

- (void) awakeFromNib{
  [super awakeFromNib];
  [self refresh];
}

- (void) layoutSubviews{
  [super layoutSubviews];
  [self refresh];
}

#pragma mark - helpers

/// Initialize the main view from a XIB file
- (void) loadNib{
  [[NSBundle bundleForClass:self.class] loadNibNamed:NAME_NIB owner:self options:nil];
  [self addSubview:_view];
  [_view setFrame: self.bounds];
  [self nibDidLoad];
}

/// Calculate the button's intrinsic size
- (CGSize) intrinsicContentSize{
  return CGSizeMake(_radius * 2, _radius * 2);
}

- (BOOL) beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
  [super beginTrackingWithTouch:touch withEvent:event];
  
  _viewBackground.alpha = OPACITY_BACKGROUND_ON_TOUCH;
  return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
  [super endTrackingWithTouch:touch withEvent:event];
  
  _viewBackground.alpha = 1;
}

/// Refresh the button's appearance
- (void) refresh{
  CGFloat cornerRadius;
  
  [self setBackgroundColor:UIColor.clearColor];
  
  // Update corner radius
  cornerRadius = _view.frame.size.height / 2;
  
  // Update shadow view
  _viewShadow.frame = _view.bounds;
  _viewShadow.layer.shadowColor = _colorBackgroundSecond.CGColor;
  _viewShadow.layer.shadowOffset = CGSizeMake(OFFSET_SHADOW, OFFSET_SHADOW);
  _viewShadow.layer.shadowRadius = RADIUS_SHADOW;
  _viewShadow.layer.shadowOpacity = OPACITY_SHADOW;
  _viewShadow.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect: _viewShadow.bounds cornerRadius:cornerRadius].CGPath;
  _viewShadow.layer.shouldRasterize = true;
  _viewShadow.layer.rasterizationScale = UIScreen.mainScreen.scale;
  
  // Update background view
  CAGradientLayer * grad = [CAGradientLayer layer];
  grad.frame = _view.bounds;
  grad.colors = @[(id)_colorBackgroundFirst.CGColor, (id)_colorBackgroundSecond.CGColor];
  grad.startPoint = CGPointMake(0,0);
  grad.endPoint = CGPointMake(1,1);
  [_viewBackground.layer insertSublayer:grad atIndex:0];
  _viewBackground.layer.cornerRadius = cornerRadius;
  
  // Update image view
  [_viewImage setImage: _image];
  [_viewImage setTintColor: _colorTint];
}

/// Perform initial setup once the XIB file has been loaded
- (void) nibDidLoad{
  PORPalette * palette;
  
  // Configure colors
  palette = [PORPalette sharedPalette];
  _colorTint = palette.colorTextInverted;
  _colorBackgroundFirst = palette.colorPrimary;
  _colorBackgroundSecond = palette.colorSecondary;
  
  // Configure radius
  _radius = RADIUS;
  [self invalidateIntrinsicContentSize];
}


/// Update the button's size
- (void) updateSize{
  [self invalidateIntrinsicContentSize];
}

@end
