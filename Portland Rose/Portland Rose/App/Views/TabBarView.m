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
static CGFloat const OFFSET_SHADOW_HIGHTLIGHT = 2.5;
static CGFloat const RADIUS_SHADOW_HIGHLIGHT = 2.5;

@interface TabBarView()

@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIView *viewHighlight;
@property (weak, nonatomic) IBOutlet UIStackView *viewStack;
@property (weak, nonatomic) IBOutlet UIView *viewDividerTop;



@property NSMutableArray * constraintsHighlight;
@property NSMutableArray * buttons;

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
  
  // Configure divider bar color
  [_viewDividerTop setBackgroundColor: palette.colorDivider];

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
  
  // Populate `_buttons` array and configure buttons
  NSUInteger nBtns;
  UIButton * btn;
  nBtns = _viewStack.arrangedSubviews.count - 2;
  _buttons = [[NSMutableArray alloc] initWithCapacity:nBtns];
  for (int i = 1; i <= nBtns; i++){
    btn = _viewStack.arrangedSubviews[i];
    btn.tag = i - 1;
    _buttons[btn.tag] = btn;
  }
  
  // Populate `_constraintsHighlight` array and configure constraints
  NSLayoutConstraint * c;
  _constraintsHighlight = [[NSMutableArray alloc] initWithCapacity: nBtns];
  for (int i = 0; i < nBtns; i++){
    c = [NSLayoutConstraint constraintWithItem:_viewHighlight attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_buttons[i] attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    [c setPriority:UILayoutPriorityDefaultLow];
    [c setActive: YES];
    _constraintsHighlight[i] = c;
  }
  
  // Configure data properties
  [self setSelectedIndex:0];
  
}

- (void) refresh {

}

- (IBAction)handleTap:(UIButton *)sender {
  NSInteger index = sender.tag;
  [self setSelectedIndex: index];
}

- (void) setSelectedIndex:(NSUInteger) selectedIndex{
  Palette * palette;
  
  palette = [Palette sharedPalette];
  _selectedIndex = selectedIndex;
  for (NSLayoutConstraint * c in _constraintsHighlight){
    [c setPriority:UILayoutPriorityDefaultLow];
  }
  for (UIButton * b in _buttons){
    [b setTintColor: palette.colorText];
  }
  [_constraintsHighlight[selectedIndex] setPriority:UILayoutPriorityDefaultHigh];
  [_buttons[selectedIndex] setTintColor:palette.colorPrimary];
  
  [self sendActionsForControlEvents:UIControlEventValueChanged];
}



@end
