//
//  PORBadge+Samples.m
//  Portland Rose
//
//  Created by Hunter Ford on 16/05/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORBadge+Samples.h"

@implementation PORBadge (Samples)

+ (PORBadge *)cocktailBadge{
  return [[PORBadge alloc] initWithIconNamed:@"icon-cocktail-50" andTitle:@"Cocktails"];
}

+ (PORBadge *)coffeeBadge{
  return [[PORBadge alloc] initWithIconNamed:@"icon-coffee-50" andTitle:@"Coffee"];
}

+ (PORBadge *)foodBadge{
  return [[PORBadge alloc] initWithIconNamed:@"icon-cutlery-50" andTitle:@"Food"];
}

+ (PORBadge *)moonBadge{
  return [[PORBadge alloc] initWithIconNamed:@"icon-moon-50" andTitle:@"Night"];
}

+ (PORBadge *)movieBadge{
  return [[PORBadge alloc] initWithIconNamed:@"icon-film-50" andTitle:@"Movie"];
}

+ (PORBadge *)scenicBadge{
  return [[PORBadge alloc] initWithIconNamed:@"icon-camera-50" andTitle:@"Scenic"];
}

#pragma mark - helpers

/**
 * Create an instance with the given icon name and title.
 */
- (instancetype) initWithIconNamed: (NSString *) iconName andTitle: (NSString *) title{
  UIImage * icon;
  
  icon = [UIImage imageNamed:iconName];
  NSAssert(icon, @"Could not find icon named: %@", iconName);
  
  return [self initWithIcon: icon andTitle:title];
}

@end
