//
//  POREmptyStateDemoViewController.m
//  Portland Rose
//
//  Created by Hunter Ford on 07/05/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "POREmptyStateDemoViewController.h"

@interface POREmptyStateDemoViewController ()

@property (weak, nonatomic) IBOutlet POREmptyStateView *viewEmptyState;

@end

@implementation POREmptyStateDemoViewController

#pragma mark - lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.viewEmptyState setDelegate:self];
}

#pragma mark - <POREmptyStateViewDelegate>

- (void)didSelectEmptyStateView:(POREmptyStateView *)emptyStateView{
  [self.viewEmptyState setActionable:NO];
  [self.viewEmptyState setSubhead:nil];
  [self.viewEmptyState setHeadline:@"Good"];
}


@end
