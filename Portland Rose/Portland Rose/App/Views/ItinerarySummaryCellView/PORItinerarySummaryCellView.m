//
//  PORItinerarySummaryCellView.m
//  Portland Rose
//
//  Created by Hunter Ford on 11/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORItinerarySummaryCellView.h"

@interface PORItinerarySummaryCellView()

@property PORItinerarySummaryView * viewItinerarySummary;

@end

@implementation PORItinerarySummaryCellView

#pragma mark - lifecycle

- (void)awakeFromNib {
  [super awakeFromNib];
  [self setUp];
}

- (void)prepareForInterfaceBuilder{
  [super prepareForInterfaceBuilder];
  [self setUp];
}

#pragma mark - helpers

- (void) setUp {
  self.translatesAutoresizingMaskIntoConstraints = NO;
  _viewItinerarySummary = [[PORItinerarySummaryView alloc] initWithFrame: self.contentView.bounds];
  [self.contentView addSubview:_viewItinerarySummary];
}

@end
