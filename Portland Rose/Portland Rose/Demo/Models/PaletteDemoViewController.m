//
//  PaletteDemoViewController.m
//  Portland Rose
//
//  Created by Hunter Ford on 03/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PaletteDemoViewController.h"


static NSString * const NAME_COLOR_BACKGROUND = @"Background";
static NSString * const NAME_COLOR_PRIMARY = @"Primary";
static NSString * const NAME_COLOR_SECONDARY = @"Secondary";
static NSString * const NAME_COLOR_TEXT = @"Text";
static NSString * const NAME_COLOR_TEXT_LOUD = @"Text (Loud)";

static NSString * const REUSE_IDENTIFIER_CELL_COLOR = @"ColorCell";

@interface PaletteDemoViewController ()

@property NSArray * colors;
@property Palette * palette;

@end

@implementation PaletteDemoViewController


- (void)viewDidLoad {
  [super viewDidLoad];
  [self loadColors];
}

- (void)loadColors {
  _palette = [Palette sharedPalette];
  _colors = @[
              @[NAME_COLOR_PRIMARY, _palette.colorPrimary],
              @[NAME_COLOR_SECONDARY, _palette.colorSecondary],
              @[NAME_COLOR_BACKGROUND, _palette.colorBackground],
              @[NAME_COLOR_TEXT, _palette.colorText],
              @[NAME_COLOR_TEXT_LOUD, _palette.colorTextLoud]
              ];
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return [_colors count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:REUSE_IDENTIFIER_CELL_COLOR forIndexPath:indexPath];
  UIColor * color = _colors[indexPath.section][1];
  [cell.contentView setBackgroundColor:color];
  return cell;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
  return _colors[section][0];
}

@end
