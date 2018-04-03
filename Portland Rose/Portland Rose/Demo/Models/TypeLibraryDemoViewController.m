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
  _typeLibrary = [TypeLibrary sharedTypeLibrary];
  _fonts = @[
             @[@"Body", _typeLibrary.fontBody],
             @[@"Headline", _typeLibrary.fontHeadline],
             @[@"Subtitle", _typeLibrary.fontSubtitle],
             @[@"Title", _typeLibrary.fontTitle]
             ];
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  UITableViewCell *cell;
  NSString * title;
  UIFont * font;
  NSInteger index;
  
  index = indexPath.row;
  cell = [tableView dequeueReusableCellWithIdentifier:REUSE_IDENTIFIER_CELL_FONT forIndexPath:indexPath];
  title = _fonts[index][0];
  font = _fonts[index][1];
  
  [cell.textLabel setFont: font];
  [cell.textLabel setText: title];
  
  return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [_fonts count];
}

@end
