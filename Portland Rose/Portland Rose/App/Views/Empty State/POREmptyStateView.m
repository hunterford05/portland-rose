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
  [self.view setBackgroundColor: palette.colorDivider];
  
}

@end
