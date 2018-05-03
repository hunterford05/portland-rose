//
//  PORBadge.m
//  Portland Rose
//
//  Created by Hunter Ford on 12/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORBadge.h"

@implementation PORBadge

#pragma mark - lifecycle

- (instancetype) initWithIcon:(UIImage *)icon andTitle:(NSString *)title{
  self = [super init];
  _icon = icon;
  _title = title;
  return self;
}

@end
