//
//  POREmptyStateView.m
//  Portland Rose
//
//  Created by Hunter Ford on 07/05/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "POREmptyStateView.h"

/// Nib filename
static NSString * const NAME_NIB = @"POREmptyStateView";

@interface POREmptyStateView()

/// Main view
@property (strong, nonatomic) IBOutlet UIView *view;
/// Headline view
@property (weak, nonatomic) IBOutlet UILabel *viewLabelHeadline;
/// Subheader view
@property (weak, nonatomic) IBOutlet UILabel *viewLabelSubhead;
/// Action button view (displayed if the user can interact with this empty state).
@property (weak, nonatomic) IBOutlet PORActionButtonView *viewButtonAction;

@end

@implementation POREmptyStateView

#pragma mark - lifecycle

- (instancetype) initWithCoder:(NSCoder *)aDecoder{
  self = [super initWithCoder:aDecoder];
  if (self){
    [self loadNib];
  }
  return self;
}

- (instancetype) initWithFrame:(CGRect)frame{
  self = [super initWithFrame:frame];
  if (self){
    [self loadNib];
  }
  return self;
}

- (void)drawRect:(CGRect)rect{
  [self refresh];
  [super drawRect:rect];
}


#pragma mark - setters

- (void)setActionable:(BOOL)actionable{
  _actionable = actionable;
  [self setNeedsDisplay];
}

- (void)setHeadline:(NSString *)headline{
  _headline = headline;
  [self setNeedsDisplay];
}

- (void)setSubhead:(NSString *)subhead{
  _subhead = subhead;
  [self setNeedsDisplay];
}

- (void)setTextButton:(NSString *)textButton{
  _textButton = textButton;
  [self setNeedsDisplay];
}


#pragma mark - helpers

- (void)loadNib{
  [[NSBundle bundleForClass:self.class] loadNibNamed:NAME_NIB owner:self options:nil];
  [self addSubview:_view];
  [_view setFrame: self.bounds];
  [self nibDidLoad];
}

- (void)nibDidLoad{
  PORPalette * palette;
  PORTypeLibrary * typeLibrary;
  
  palette = [PORPalette sharedPalette];
  typeLibrary = [PORTypeLibrary sharedTypeLibrary];
  
  // Set background
  [self setBackgroundColor:UIColor.clearColor];
  [self.view setBackgroundColor:palette.colorDivider];
  
  // Set label fonts
  [self.viewLabelHeadline setFont:typeLibrary.fontSubtitle];
  [self.viewLabelSubhead setFont:typeLibrary.fontHeadline];
  
  // Set label colors
  [self.viewLabelHeadline setTextColor:palette.colorText];
  [self.viewLabelSubhead setTextColor:palette.colorText];
  
  // Set default properties
  self.actionable = NO;
  self.subhead = self.viewLabelSubhead.text;
  self.textButton = self.viewButtonAction.text;
  self.headline = self.viewLabelHeadline.text;
}

- (void)refresh{
  // Configure button visibility
  [self.viewButtonAction setHidden:!self.actionable];
  
  // Configure button text
  [self.viewButtonAction setText:self.textButton];
  
  // Configure label text
  [self.viewLabelHeadline setText:self.headline];
  [self.viewLabelSubhead setText:self.subhead];
}

#pragma mark - events

- (IBAction)didTapActionButton:(id)sender {
  if (self.delegate){
    [self.delegate didSelectEmptyStateView:self];
  }
}


@end
