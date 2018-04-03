//
//  TypeLibraryDemoViewController.m
//  Portland Rose
//
//  Created by Hunter Ford on 03/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "TypeLibraryDemoViewController.h"


NSString * const REUSE_IDENTIFIER_CELL_FONT = @"FontCell";

@interface TypeLibraryDemoViewController ()

@property NSArray * fonts;
@property TypeLibrary * typeLibrary;

@end

@implementation TypeLibraryDemoViewController


- (void)viewDidLoad {
  [super viewDidLoad];
  [self loadFonts];
}

- (void)loadFonts {
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:REUSE_IDENTIFIER_CELL_FONT forIndexPath:indexPath];
  UIFont * font = _fonts[indexPath.row][1];
  [cell.textLabel setFont: font];
  return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [_fonts count];
}

@end
