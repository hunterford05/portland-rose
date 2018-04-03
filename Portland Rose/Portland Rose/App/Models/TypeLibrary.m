//
//  TypeLibrary.m
//  Portland Rose
//
//  Created by Hunter Ford on 03/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "TypeLibrary.h"

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
  }
  return self;
}

@end
