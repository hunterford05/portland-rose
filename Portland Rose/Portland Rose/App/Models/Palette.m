//
//  Palette.m
//  Portland Rose
//
//  Created by Hunter Ford on 03/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "Palette.h"

static NSString * const HEX_BLACK = @"#000000";
static NSString * const HEX_COMET = @"#59617E";
static NSString * const HEX_FROLY = @"#F4727E";
static NSString * const HEX_THULIAN_PINK = @"#EC6AA0";
static NSString * const HEX_WHITE = @"#FFFFFF";

@implementation Palette

/// Shared singleton `Palette` instance
+ (id) sharedPalette{
  static Palette *sharedPalette = nil;
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
    _colorPrimary = [UIColor colorWithHexString:HEX_FROLY];
    _colorSecondary = [UIColor colorWithHexString:HEX_THULIAN_PINK];
    _colorText = [UIColor colorWithHexString: HEX_COMET];
    _colorTextInverted = [UIColor colorWithHexString: HEX_WHITE];
    _colorTextLoud = [UIColor colorWithHexString:HEX_BLACK];
  }
  return self;
}


@end
