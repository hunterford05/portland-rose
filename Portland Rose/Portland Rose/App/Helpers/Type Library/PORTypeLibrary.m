//
//  PORTypeLibrary.m
//  Portland Rose
//
//  Created by Hunter Ford on 03/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORTypeLibrary.h"


/// Font name for body text
static NSString * const FONT_NAME_BODY = @"ArialRoundedMTBold";
/// Font name for headline text
static NSString * const FONT_NAME_HEADLINE = FONT_NAME_BODY;
/// Font name for subtitle text
static NSString * const FONT_NAME_SUBTITLE = FONT_NAME_BODY;
/// Font name for title text
static NSString * const FONT_NAME_TITLE = FONT_NAME_BODY;

/// Font size for body text
static CGFloat const FONT_SIZE_BODY = 24.0 / 2;
/// Font size for headline text
static CGFloat const FONT_SIZE_HEADLINE = 32.0 / 2;
/// Font size for subtitle text
static CGFloat const FONT_SIZE_SUBTITLE = 40.0 / 2;
/// Font size for title text
static CGFloat const FONT_SIZE_TITLE = 64.0 / 2;

@implementation PORTypeLibrary

/// Shared singleton `TypeLibrary` instance
+ (id) sharedTypeLibrary {
  static PORTypeLibrary *sharedTypeLibrary = nil;
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
