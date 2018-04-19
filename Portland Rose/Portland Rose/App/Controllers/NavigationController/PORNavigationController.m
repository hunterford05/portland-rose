//
//  PORNavigationController.m
//  Portland Rose
//
//  Created by Hunter Ford on 19/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORNavigationController.h"

@interface PORNavigationController ()

@end

@implementation PORNavigationController

#pragma mark - lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  [self styleNavigationBar];
}


#pragma mark - helpers

- (void)styleNavigationBar{
  PORPalette * palette;
  PORTypeLibrary * typeLibrary;
  UINavigationBar * navBar;

  navBar = self.navigationBar;
  palette = [PORPalette sharedPalette];
  typeLibrary = [PORTypeLibrary sharedTypeLibrary];
  NSAssert(navBar, @"`PORNavigationController`'s `navigationBar` is nil.");
  
  // Style the navigation bar
  [navBar setBackgroundColor:palette.colorBackground];
  [navBar setBarTintColor:palette.colorBackground];
  [navBar setTitleTextAttributes:
   @{NSForegroundColorAttributeName: palette.colorTextLoud,
     NSFontAttributeName: typeLibrary.fontHeadline}];
  
  // Style bar button items
  [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]]
   setTitleTextAttributes:@{NSForegroundColorAttributeName: palette.colorTextLoud,
                            NSFontAttributeName: typeLibrary.fontHeadline} forState:UIControlStateNormal];
  [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]]
   setTintColor: palette.colorTextLoud];
}


@end
