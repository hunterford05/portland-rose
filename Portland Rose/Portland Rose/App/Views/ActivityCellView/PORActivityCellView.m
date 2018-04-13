//
//  PORActivityCellView.m
//  Portland Rose
//
//  Created by Hunter Ford on 12/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORActivityCellView.h"

/// Nib filename
static NSString * const NAME_NIB = @"PORActivityCellView";
/// Reuse identifier
static NSString * const REUSE_IDENTIFIER = @"ActivityCell";

@interface PORActivityCellView()

@property (weak, nonatomic) IBOutlet UILabel *viewLabelTitle;
@property (weak, nonatomic) IBOutlet UILabel *viewLabelDescription;
@property (weak, nonatomic) IBOutlet UIImageView *viewImageIcon;

@end

@implementation PORActivityCellView

- (void)awakeFromNib {
  [super awakeFromNib];
  [self setUp];
}

#pragma mark - helpers

- (void) setUp{
  PORPalette * palette;
  PORTypeLibrary * typeLibrary;
  
  palette = [PORPalette sharedPalette];
  typeLibrary = [PORTypeLibrary sharedTypeLibrary];
  
  // Configure label colors
  [_viewLabelTitle setTextColor: palette.colorTextLoud];
  [_viewLabelDescription setTextColor: palette.colorText];
  
  // Configure label fonts
  [_viewLabelTitle setFont: typeLibrary.fontHeadline];
  [_viewLabelDescription setFont: typeLibrary.fontBody];
  
  // Configure icon tints
  [_viewImageIcon setTintColor: palette.colorTextLoud];
  
}

#pragma mark - class

+ (NSString *) nibName {
  return NAME_NIB;
}

+ (NSString *) reuseIdentifier {
  return REUSE_IDENTIFIER;
}

@end
