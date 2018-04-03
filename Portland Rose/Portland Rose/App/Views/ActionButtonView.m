//
//  ActionButtonView.m
//  Portland Rose
//
//  Created by Hunter Ford on 03/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "ActionButtonView.h"
#import "Palette.h"
#import "TypeLibrary.h"

/// Name of XIB file
NSString * const NAME_NIB = @"ActionButtonView";
/// Opacity of the button's shadow
CGFloat const OPACITY_SHADOW = 0.59;
/// Offset (horizontal and vertical) of the button's shadow
CGFloat const OFFSET_SHADOW = 3.0;
/// Radius of the button's shadow
CGFloat const RADIUS_SHADOW = 12.0;
/// Padding, as a multiple of the font size, between the top edge of the button and the text
CGFloat const PADDING_TOP = 1.0;
/// Padding, as a multiple of the font size, between the leading (left) edge of the button and the text
CGFloat const PADDING_LEADING = 2.0;
/// Default button text
NSString * const TEXT_PLACEHOLDER = @"Hello, Puffins!";

@interface ActionButtonView()

@property (weak, nonatomic) IBOutlet UILabel *labelViewText;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIView *viewBackground;
@property (weak, nonatomic) IBOutlet UIView *viewShadow;


@end

@implementation ActionButtonView


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

/// Initialize the main view from a XIB file
- (void) loadNib{
  [[NSBundle bundleForClass:self.class] loadNibNamed:NAME_NIB owner:self options:nil];
  [self addSubview:_view];
  [_view setFrame: self.bounds];
  [self nibDidLoad];
}

/// Calculate the button's intrinsic size
- (CGSize) intrinsicContentSize{
  return [self calculateSize];
}

/// Refresh the button's appearance
- (void) refresh{
  CGFloat cornerRadius;
  
  cornerRadius = _view.frame.size.height / 2;
  
  // Update label
  [_labelViewText setTextColor:_colorLabel];
  
  // Update shadow view
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
}

/// Perform initial setup once the XIB file has been loaded
- (void) nibDidLoad{
  Palette * palette;
  
  // Configure colors
  palette = [Palette sharedPalette];
  _colorLabel = palette.colorTextInverted;
  _colorBackgroundFirst = palette.colorPrimary;
  _colorBackgroundSecond = palette.colorSecondary;
  
  // Configure label text
  [self setText: TEXT_PLACEHOLDER];
  [_labelViewText setFont:[TypeLibrary.sharedTypeLibrary fontBody]];
}

- (void) setText:(NSString *)text{
  _text = text;
  [_labelViewText setText:_text];
  [self updateSize];
}

/// Calculate the intrinsic size of the button based on the size of its text label
- (CGSize) calculateSize {
  CGSize labelSize;
  CGFloat height;
  CGFloat width;
  CGFloat fontSize;
  
  labelSize = [_labelViewText.text sizeWithAttributes:@{NSFontAttributeName: _labelViewText.font}];
  fontSize = _labelViewText.font.pointSize;
  height = labelSize.height + fontSize * PADDING_TOP * 2;
  width = labelSize.width + fontSize * PADDING_LEADING * 2;
  
  return CGSizeMake(width, height);
}

/// Update the button's size
- (void) updateSize{
  [self invalidateIntrinsicContentSize];
}

@end
