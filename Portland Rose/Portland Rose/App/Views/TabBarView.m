//
//  TabBarView.m
//  Portland Rose
//
//  Created by Hunter Ford on 04/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "TabBarView.h"
#import "Palette.h"

/// Name of XIB file
static NSString * const NAME_NIB = @"TabBarView";
static CGFloat const OPACITY_SHADOW_HIGHLIGHT = 0.5;
static CGFloat const OFFSET_SHADOW_HIGHTLIGHT = 5.0;
static CGFloat const RADIUS_SHADOW_HIGHLIGHT = 5.0;

@interface TabBarView()

@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIView *viewHighlight;

@end

@implementation TabBarView

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
  [[NSBundle bundleForClass:self.class] loadNibNamed: NAME_NIB owner:self options:nil];
  [self addSubview:_view];
  [_view setFrame: self.bounds];
  [self nibDidLoad];
}

- (void) nibDidLoad{
  Palette * palette;
  CAGradientLayer * grad;

  palette = [Palette sharedPalette];

  // Configure highlight bar gradient
  grad = [CAGradientLayer layer];
  grad.frame = _viewHighlight.bounds;
  grad.colors = @[(id)palette.colorPrimary.CGColor, (id)palette.colorSecondary.CGColor];
  grad.startPoint = CGPointMake(0,0);
  grad.endPoint = CGPointMake(1,1);
  [_viewHighlight.layer insertSublayer:grad atIndex:0];
  
  // Configure highlight bar shadow
  CGFloat o = OFFSET_SHADOW_HIGHTLIGHT;
  CALayer * lh = _viewHighlight.layer;
  lh.shadowColor = palette.colorPrimary.CGColor;
  lh.shadowOffset = CGSizeMake(o, o) ;
  lh.shadowRadius = RADIUS_SHADOW_HIGHLIGHT;
  lh.shadowOpacity = OPACITY_SHADOW_HIGHLIGHT;
  lh.shadowPath = [UIBezierPath bezierPathWithRect: _viewHighlight.bounds].CGPath;
  lh.shouldRasterize = true;
  lh.rasterizationScale = UIScreen.mainScreen.scale;
  
  
}

- (void) refresh {
  
}


@end
