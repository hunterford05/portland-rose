//
//  PORNavigationController.m
//  Portland Rose
//
//  Created by Hunter Ford on 19/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORNavigationController.h"

/// Thickness of nav bar divider
static CGFloat const HEIGHT_NAV_BAR_DIVIDER = 1.0;

@interface PORNavigationController ()

@end

@implementation PORNavigationController

#pragma mark - lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  [self styleNavigationBar];
}


#pragma mark - helpers

/**
 * Style the navigation controller's navigation bar.
 */
- (void)styleNavigationBar{
  PORPalette * palette;
  PORTypeLibrary * typeLibrary;
  UINavigationBar * navBar;

  navBar = self.navigationBar;
  palette = [PORPalette sharedPalette];
  typeLibrary = [PORTypeLibrary sharedTypeLibrary];
  NSAssert(navBar, @"`PORNavigationController`'s `navigationBar` is nil.");
  
  // Style the navigation bar
  [self styleNavigationBar:navBar WithPalette:palette andTypeLibrary:typeLibrary];
  
  // Style bar button items
  [self styleBarButtonItemsWithPalette:palette andTypeLibrary: typeLibrary];
  
  // Style navigation bar border
  [self styleNavigationBar: navBar borderWithPalette: palette];
}

/**
 * Style the given `UINavigationBar` instance.
 */
- (void)styleNavigationBar: (UINavigationBar *) navBar WithPalette: (PORPalette *) palette andTypeLibrary: (PORTypeLibrary *) typeLibrary{
  [navBar setBackgroundColor:palette.colorBackground];
  [navBar setBarTintColor:palette.colorBackground];
  [navBar setTitleTextAttributes:
   @{NSForegroundColorAttributeName: palette.colorTextLoud,
     NSFontAttributeName: typeLibrary.fontHeadline}];
}

/**
 * Style all bar button items added to an instance of the `PORNavigationController`
 * class.
 */
- (void)styleBarButtonItemsWithPalette: (PORPalette *) palette andTypeLibrary: (PORTypeLibrary *) typeLibrary{
  [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]]
   setTitleTextAttributes:@{NSForegroundColorAttributeName: palette.colorTextLoud,
                            NSFontAttributeName: typeLibrary.fontHeadline} forState:UIControlStateNormal];
  [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]]
   setTintColor: palette.colorTextLoud];
}

/**
 * Add a bottom border to the given navigation bar and style it.
 */
- (void)styleNavigationBar: (UINavigationBar *) navBar borderWithPalette: (PORPalette *) palette{
}


@end
