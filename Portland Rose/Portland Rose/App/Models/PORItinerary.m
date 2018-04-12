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

@end
