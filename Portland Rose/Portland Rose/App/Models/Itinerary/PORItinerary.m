//
//  PORItinerary.m
//  Portland Rose
//
//  Created by Hunter Ford on 12/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORItinerary.h"

@implementation PORItinerary

- (NSArray *) badgeIcons{
  NSMutableArray * a;
  
  a = [[NSMutableArray alloc] init];
  for (PORBadge * b in _badges){
    if (b.icon){
      [a addObject: b.icon];
    }
  }
  
  return [[NSArray alloc] initWithArray: a];
}

- (NSArray <UIImage *> *) allImages {
  NSUInteger count;
  NSMutableArray <UIImage *> * images;
  
  count = _imagesSecondary ? [_imagesSecondary count] + 1 : 1;
  images = [[NSMutableArray alloc] initWithCapacity:count];
  [images addObject: _imageMain];
  for (int i = 0; i < count - 1; i++){
    [images addObject: _imagesSecondary[i]];
  }
  return [[NSArray <UIImage *> alloc] initWithArray:images];
}

@end
