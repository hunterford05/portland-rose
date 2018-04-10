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

static CGFloat const INSET_IMAGE = 19.0;
static CGFloat const RADIUS = 32.0;

@interface PORFloatingActionButtonView()

@property UIImageView * viewImage;

@end

@implementation PORFloatingActionButtonView

#pragma mark - helpers


/// Calculate the button's intrinsic size
- (CGSize) intrinsicContentSize{
  return CGSizeMake(_radius * 2, _radius * 2);
}

/// Refresh the button's appearance
- (void) refresh{
  [super refresh];
  
  // Update image view
  [_viewImage setFrame: CGRectInset(self.view.bounds, INSET_IMAGE, INSET_IMAGE)];
  [_viewImage setImage: _image];
  [_viewImage setTintColor: _colorTint];
}

/// Perform initial setup once the XIB file has been loaded
- (void) nibDidLoad{
  [super nibDidLoad];
  
  // Configure label
  [self.viewLabelText setHidden:YES];
  
  // Configure image view
  _viewImage = [[UIImageView alloc] initWithFrame: self.view.bounds];
  [self.view addSubview: _viewImage];
  
  // Configure radius
  _radius = RADIUS;
  [self invalidateIntrinsicContentSize];
  
  // Configure image tint
  _colorTint = [[PORPalette sharedPalette] colorTextInverted];
}

@end
