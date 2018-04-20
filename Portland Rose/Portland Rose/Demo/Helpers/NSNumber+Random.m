//
//  NSNumber+Random.m
//  Portland Rose
//
//  Created by Hunter Ford on 12/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "NSNumber+Random.h"

@implementation NSNumber (Random)

+ (NSUInteger) getRandomUnsignedIntegerLessThan: (NSUInteger) max {
  return arc4random_uniform((uint32_t)max);
}

@end
