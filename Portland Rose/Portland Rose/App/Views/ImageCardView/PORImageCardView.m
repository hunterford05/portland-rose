//
//  PORImageCardView.m
//  Portland Rose
//
//  Created by Hunter Ford on 06/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORImageCardView.h"

/// Name of NIB file
static NSString * const NAME_NIB = @"PORImageCardView";

@interface PORImageCardView()

@property (strong, nonatomic) IBOutlet UIView *view;

@end

@implementation PORImageCardView

- (instancetype) initWithCoder:(NSCoder *)aDecoder{
  self = [super initWithCoder:aDecoder];
  if (self) {
    [self loadNib];
  }
  return self;
}

- (instancetype) initWithFrame:(CGRect)frame {
  self = [super initWithFrame: frame];
  if (self){
    [self loadNib];
  }
  return self;
}

- (void) loadNib {
  [[NSBundle bundleForClass:self.class] loadNibNamed:NAME_NIB owner:self options:nil];
  [_view setFrame: self.bounds];
  [self addSubview: _view];
}

@end
