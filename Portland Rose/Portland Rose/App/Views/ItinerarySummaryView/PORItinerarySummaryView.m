//
//  PORItinerarySummaryView.m
//  Portland Rose
//
//  Created by Hunter Ford on 11/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORItinerarySummaryView.h"

/// NIB name
static NSString * const NAME_NIB = @"PORItinerarySummaryView";

@interface PORItinerarySummaryView()
/// Main view
@property (strong, nonatomic) IBOutlet UIView *view;
@end

@implementation PORItinerarySummaryView

#pragma mark - lifecycle

- (instancetype) initWithFrame:(CGRect)frame{
  self = [super initWithFrame:frame];
  [self loadNib];
  return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder{
  self = [super initWithCoder:aDecoder];
  [self loadNib];
  return self;
}

#pragma mark - helpers

- (void) loadNib {
  [[NSBundle bundleForClass:self.class] loadNibNamed:NAME_NIB owner:self options:nil];
  [self nibDidLoad];
}

- (void) nibDidLoad {
  _view.frame = self.bounds;
  [self addSubview: _view];
}

@end
