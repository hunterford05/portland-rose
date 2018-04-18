//
//  PORItineraryHeaderCellView.m
//  Portland Rose
//
//  Created by Hunter Ford on 18/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORItineraryHeaderCellView.h"

static NSString * const NAME_NIB = @"PORItineraryHeaderCellView";
static NSString * const REUSE_IDENTIFIER = @"ItineraryHeaderCell";

@implementation PORItineraryHeaderCellView

- (void)awakeFromNib {
  [super awakeFromNib];
}

#pragma mark - class

/**
 * The name of the NIB file associated with this class.
 */
+ (NSString *) nibName {
  return NAME_NIB;
}

/**
 * The name of the reuse identifier associated with this class.
 */
+ (NSString *) reuseIdentifier {
  return REUSE_IDENTIFIER;
}

@end
