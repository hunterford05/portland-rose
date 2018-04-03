//
//  TypeLibrary.m
//  Portland Rose
//
//  Created by Hunter Ford on 03/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "TypeLibrary.h"



NSString * const FONT_NAME_BODY = @"ArialRoundedMTBold";
NSString * const FONT_NAME_HEADLINE = FONT_NAME_BODY;
NSString * const FONT_NAME_SUBTITLE = FONT_NAME_BODY;
NSString * const FONT_NAME_TITLE = FONT_NAME_BODY;

CGFloat const FONT_SIZE_BODY = 24.0 / 2;
CGFloat const FONT_SIZE_HEADLINE = 32.0 / 2;
CGFloat const FONT_SIZE_SUBTITLE = 40.0 / 2;
CGFloat const FONT_SIZE_TITLE = 64.0 / 2;

@implementation TypeLibrary

/// Shared singleton `Palette` instance
+ (id) sharedTypeLibrary {
  static TypeLibrary *sharedTypeLibrary = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedTypeLibrary = [[self alloc] init];
  });
  return sharedTypeLibrary;
}

- (id) init{
  if (self = [super init]) {
    // Initialize type library fonts
    _fontBody = [UIFont fontWithName:FONT_NAME_BODY size:FONT_SIZE_BODY];
    _fontHeadline = [UIFont fontWithName:FONT_NAME_HEADLINE size:FONT_SIZE_HEADLINE];
    _fontSubtitle = [UIFont fontWithName:FONT_NAME_SUBTITLE size:FONT_SIZE_SUBTITLE];
    _fontTitle = [UIFont fontWithName:FONT_NAME_TITLE size:FONT_SIZE_TITLE];
  }
  return self;
}

@end
