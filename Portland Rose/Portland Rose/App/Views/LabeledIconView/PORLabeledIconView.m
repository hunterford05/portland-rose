//
//  PORLabeledIconView.m
//  Portland Rose
//
//  Created by Hunter Ford on 12/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORLabeledIconView.h"

static NSString * const NAME_NIB = @"PORLabeledIconView";

@interface PORLabeledIconView()

/// Primary view
@property (strong, nonatomic) IBOutlet UIView *view;
/// Icon view
@property (weak, nonatomic) IBOutlet UIImageView *viewIcon;
/// Label view
@property (weak, nonatomic) IBOutlet UILabel *viewLabel;
/// Stack view containing the icon and label
@property (weak, nonatomic) IBOutlet UIStackView *viewStack;

@end

@implementation PORLabeledIconView

#pragma mark - lifecycle

- (instancetype) initWithCoder:(NSCoder *)aDecoder{
  self = [super initWithCoder:aDecoder];
  [self loadNib];
  return self;
}

- (instancetype) initWithFrame:(CGRect)frame{
  self = [super initWithFrame:frame];
  [self loadNib];
  return self;
}

- (void) awakeFromNib {
  [super awakeFromNib];
  [self refresh];
}


- (void) prepareForInterfaceBuilder{
  [self refresh];
}

#pragma mark - setters

- (void)setText:(NSString *)text{
  _text = text;
  [self refresh];
}

#pragma mark - helpers

/**
 * Load the view from its NIB.
 */
- (void) loadNib{
  [[NSBundle bundleForClass:self.class] loadNibNamed:NAME_NIB owner:self options:nil];
  [_view setFrame: self.bounds];
  [self addSubview: _view];
  [self nibDidLoad];
}

/**
 * Perform initial setup and styling.
 */
- (void) nibDidLoad {
  PORPalette * palette;
  PORTypeLibrary * typeLibrary;
  
  palette = [PORPalette sharedPalette];
  typeLibrary = [PORTypeLibrary sharedTypeLibrary];
  
  // Set color
  if (!_color){
    _color = palette.colorText;
  }
  
  // Configure
  if (!_font){
    _font = typeLibrary.fontBody;
  }
}

/**
 * Update subviews.
 */
- (void) refresh{
  // Refresh label
  [_viewLabel setText: _text];
  [_viewLabel setTextColor: _color];
  [_viewLabel setFont: _font];
  // Refresh icon
  [_viewIcon setImage: _icon];
  [_viewIcon setTintColor:_color];
  // Refresh stack spacing
  [_viewStack setSpacing: _spacingStack];
  // Set `hidden` property
  [self setHidden: [self shouldBeHidden]];
}

/**
 * Should this view be hidden? Return true if the text label would be empty
 * (i.e. if `text` is nil or if `text` contains only whitespace characters)
 */
- (BOOL) shouldBeHidden {
  NSCharacterSet *set;

  set = [NSCharacterSet whitespaceCharacterSet];

  return  (!_text || [[_text stringByTrimmingCharactersInSet: set] length] == 0);
}

@end
