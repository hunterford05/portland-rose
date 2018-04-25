//
//  PORLibraryDemoViewController.m
//  Portland Rose
//
//  Created by Hunter Ford on 25/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORLibraryDemoViewController.h"

@interface PORLibraryDemoViewController ()

@property PORLibrary * library;

@end

@implementation PORLibraryDemoViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setTitle: @"Library Demo"];
  [self loadLibrary];
}

#pragma mark - helpers

- (void) loadLibrary {
  [self.tableView setBackgroundColor:UIColor.redColor];
  _library = [[PORLibrary alloc] initWithCompletionBlock:^{
    [self.tableView setBackgroundColor:UIColor.greenColor];
  }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}


@end
