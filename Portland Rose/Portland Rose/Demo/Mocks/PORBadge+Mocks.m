//
//  PORBadge+Mocks.m
//  Portland Rose
//
//  Created by Hunter Ford on 12/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORBadge+Mocks.h"

static NSString * const TITLES_BADGE = @"Romantic,Outdoors,Artsy";
static NSString * const NAMES_IMAGE = @"demo-icon-0,demo-icon-1,demo-icon-2,demo-icon-3,demo-icon-4,demo-icon-5,demo-icon-6";

@implementation PORBadge (Mocks)

+ (PORBadge *)mock{
  PORBadge * badge;
  
  badge = [[PORBadge alloc] init];
  badge.title = [badge getRandomTitle];
  badge.icon = [badge getRandomIcon];
  return badge;
}

+ (NSArray<PORBadge *> *)mocks: (NSUInteger) n{
  NSMutableArray * a;
  
  a = [[NSMutableArray alloc] initWithCapacity:n];
  for (int i = 0; i < n; i++){
    [a addObject:[PORBadge mock]];
  }
  return [[NSArray alloc] initWithArray:a];
}

#pragma mark - helpers

- (UIImage *) getRandomIcon {
  UIImage * img;
  NSString * name;
  
  name = [NAMES_IMAGE getRandomComponentDelimtedByCommas];
  img = [UIImage imageNamed: name];
  NSAssert(img, @"No image named '%@'", name);
  return img;
}

- (NSString *) getRandomTitle {
  return [TITLES_BADGE getRandomComponentDelimtedByCommas];
}

@end
