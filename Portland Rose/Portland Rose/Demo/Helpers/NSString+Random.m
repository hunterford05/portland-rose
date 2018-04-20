//
//  NSString+Random.m
//  Portland Rose
//
//  Created by Hunter Ford on 12/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "NSString+Random.h"

static NSString * const DELIMETER_COMMA = @",";

@implementation NSString (Random)

- (NSString *) getRandomComponentDelimtedBy: (NSString *) delimeter {
  NSArray <NSString *> * parts;
  NSUInteger rn;
  
  parts = [self componentsSeparatedByString:delimeter];
  rn = arc4random_uniform((uint32_t)[parts count]);
  
  return parts[rn];
}

- (NSString *) getRandomComponentDelimtedByCommas{
  return [self getRandomComponentDelimtedBy: DELIMETER_COMMA];
}

@end
