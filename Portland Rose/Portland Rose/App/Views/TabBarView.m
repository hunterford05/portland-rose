//
//  TabBarView.m
//  Portland Rose
//
//  Created by Hunter Ford on 04/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "TabBarView.h"

static NSString * const NAME_NIB = @"TabBarView";

@interface TabBarView()

@property (strong, nonatomic) IBOutlet UIView *view;

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
  
}

- (void) refresh {
  
}


@end
