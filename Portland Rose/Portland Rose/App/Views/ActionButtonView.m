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

NSString * const TEXT_PLACEHOLDER = @"Hello, Puffins!";
NSString * const NAME_NIB = @"ActionButtonView";
CGFloat const OPACITY_SHADOW = 0.59;
CGFloat const OFFSET_SHADOW = 3.0;
CGFloat const RADIUS_SHADOW = 12.0;
CGFloat const PADDING_TOP = 1.0;
CGFloat const PADDING_LEADING = 2.0;

@interface ActionButtonView()

@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIView *background;
@property (weak, nonatomic) IBOutlet UIView *shadow;


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

- (void) loadNib{
  [[NSBundle bundleForClass:self.class] loadNibNamed:NAME_NIB owner:self options:nil];
  [self addSubview:_view];
  [_view setFrame: self.bounds];
  [self nibDidLoad];
}

- (void) awakeFromNib{
  [super awakeFromNib];
  [self refresh];
}

- (void) layoutSubviews{
  [super layoutSubviews];
  [self refresh];
}

- (void) refresh{
  CGFloat cornerRadius;
  
  cornerRadius = _view.frame.size.height / 2;
  
  // Update label
  [_label setTextColor:_colorLabel];
  
  // Update shadow view
  _shadow.layer.shadowColor = _colorBackgroundSecond.CGColor;
  _shadow.layer.shadowOffset = CGSizeMake(OFFSET_SHADOW, OFFSET_SHADOW);
  _shadow.layer.shadowRadius = RADIUS_SHADOW;
  _shadow.layer.shadowOpacity = OPACITY_SHADOW;
  _shadow.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect: _shadow.bounds cornerRadius:cornerRadius].CGPath;
  _shadow.layer.shouldRasterize = true;
  _shadow.layer.rasterizationScale = UIScreen.mainScreen.scale;
  
  // Update background view
  CAGradientLayer * grad = [CAGradientLayer layer];
  grad.frame = _view.bounds;
  grad.colors = @[(id)_colorBackgroundFirst.CGColor, (id)_colorBackgroundSecond.CGColor];
  grad.startPoint = CGPointMake(0,0);
  grad.endPoint = CGPointMake(1,1);
  [_background.layer insertSublayer:grad atIndex:0];
  _background.layer.cornerRadius = cornerRadius;
}

- (void) nibDidLoad{
  Palette * palette;
  
  // Configure colors
  palette = [Palette sharedPalette];
  _colorLabel = palette.colorTextInverted;
  _colorBackgroundFirst = palette.colorPrimary;
  _colorBackgroundSecond = palette.colorSecondary;
  
  // Configure label text
  [self setText: TEXT_PLACEHOLDER];
  [_label setFont:[TypeLibrary.sharedTypeLibrary fontBody]];
}

- (void) setText:(NSString *)text{
  _text = text;
  [_label setText:_text];
  [self updateSize];
}

- (CGSize) calculateSize {
  CGSize labelSize;
  CGFloat height;
  CGFloat width;
  CGFloat fontSize;
  
  labelSize = [_label.text sizeWithAttributes:@{NSFontAttributeName: _label.font}];
  fontSize = _label.font.pointSize;
  height = labelSize.height + fontSize * PADDING_TOP * 2;
  width = labelSize.width + fontSize * PADDING_LEADING * 2;
  
  return CGSizeMake(width, height);
}

- (void) updateSize{
  [self invalidateIntrinsicContentSize];
}

- (CGSize) intrinsicContentSize{
  return [self calculateSize];
}

@end
