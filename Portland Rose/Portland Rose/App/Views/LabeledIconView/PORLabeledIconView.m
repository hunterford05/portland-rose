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

@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIImageView *viewIcon;
@property (weak, nonatomic) IBOutlet UILabel *viewLabel;
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

- (void) loadNib{
  [[NSBundle bundleForClass:self.class] loadNibNamed:NAME_NIB owner:self options:nil];
  [_view setFrame: self.bounds];
  [self addSubview: _view];
  [self nibDidLoad];
}

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

- (void) refresh{
  [self setHidden: [self shouldBeHidden]];
  
  [_viewLabel setText: _text];
  [_viewLabel setTextColor: _color];
  [_viewLabel setFont: _font];
  
  [_viewIcon setImage: _icon];
  [_viewIcon setTintColor:_color];
  
  [_viewStack setSpacing: _spacingStack];
}

- (BOOL) shouldBeHidden {
  NSCharacterSet *set;
  
  set = [NSCharacterSet whitespaceCharacterSet];
  return  (!_text || [[_text stringByTrimmingCharactersInSet: set] length] == 0);
}

@end
