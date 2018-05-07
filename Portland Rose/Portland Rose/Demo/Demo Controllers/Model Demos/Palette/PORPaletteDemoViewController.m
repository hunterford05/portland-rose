//
//  PORPaletteDemoViewController.m
//  Portland Rose
//
//  Created by Hunter Ford on 03/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORPaletteDemoViewController.h"


static NSString * const NAME_COLOR_BACKGROUND = @"Background";
static NSString * const NAME_COLOR_DIVIDER = @"Divider";
static NSString * const NAME_COLOR_PRIMARY = @"Primary";
static NSString * const NAME_COLOR_SECONDARY = @"Secondary";
static NSString * const NAME_COLOR_TEXT = @"Text";
static NSString * const NAME_COLOR_TEXT_LOUD = @"Text (Loud)";
static NSString * const NAME_COLOR_TEXT_MUTED = @"Text (Muted)";

static NSString * const REUSE_IDENTIFIER_CELL_COLOR = @"ColorCell";

@interface PORPaletteDemoViewController ()

@property NSArray * colors;
@property PORPalette * palette;

@end

@implementation PORPaletteDemoViewController


- (void)viewDidLoad {
  [super viewDidLoad];
  [self loadColors];
}

- (void)loadColors {
  _palette = [PORPalette sharedPalette];
  _colors = @[
              @[NAME_COLOR_PRIMARY, _palette.colorPrimary],
              @[NAME_COLOR_SECONDARY, _palette.colorSecondary],
              @[NAME_COLOR_BACKGROUND, _palette.colorBackground],
              @[NAME_COLOR_DIVIDER, _palette.colorDivider],
              @[NAME_COLOR_TEXT, _palette.colorText],
              @[NAME_COLOR_TEXT_LOUD, _palette.colorTextLoud],
              @[NAME_COLOR_TEXT_MUTED, _palette.colorTextMuted]
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
