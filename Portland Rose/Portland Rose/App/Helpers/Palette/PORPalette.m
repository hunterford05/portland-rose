//
//  PORPalette.m
//  Portland Rose
//
//  Created by Hunter Ford on 03/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORPalette.h"

static NSString * const HEX_BLACK = @"#000000";
static NSString * const HEX_COMET = @"#59617E";
static NSString * const HEX_FROLY = @"#F4727E";
static NSString * const HEX_THULIAN_PINK = @"#EC6AA0";
static NSString * const HEX_WHITE = @"#FFFFFF";
static CGFloat const OPACITY_FAINT = 0.12;

@implementation PORPalette

/// Shared singleton `Palette` instance
+ (id) sharedPalette{
  static PORPalette * sharedPalette = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedPalette = [[self alloc] init];
  });
  return sharedPalette;
}


- (id)init {
  if (self = [super init]) {
    // Initialize palette colors
    _colorBackground = [UIColor colorWithHexString:HEX_WHITE];
    _colorDivider = [UIColor colorWithHexString: HEX_COMET alpha:OPACITY_FAINT];
    _colorPrimary = [UIColor colorWithHexString:HEX_FROLY];
    _colorSecondary = [UIColor colorWithHexString:HEX_THULIAN_PINK];
    _colorText = [UIColor colorWithHexString: HEX_COMET];
    _colorTextInverted = [UIColor colorWithHexString: HEX_WHITE];
    _colorTextLoud = [UIColor colorWithHexString:HEX_BLACK];
    _colorTextMuted = [UIColor colorWithHexString: HEX_COMET alpha:OPACITY_FAINT];
  }
  return self;
}


@end
