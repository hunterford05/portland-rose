//
//  PORTabBarController.m
//  Portland Rose
//
//  Created by Hunter Ford on 04/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORTabBarController.h"
#import "TabBarView.h"

@interface PORTabBarController ()

@property (strong, nonatomic) IBOutlet TabBarView *viewTabBar;
@property (weak, nonatomic) IBOutlet UITabBar *viewUITabBar;

@end

@implementation PORTabBarController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.view addSubview: _viewTabBar];
}

- (void) viewDidLayoutSubviews{
  [_viewTabBar setFrame: _viewUITabBar.frame];
}

- (IBAction)handleTabBarValueChanged:(id)sender {
  self.selectedIndex = _viewTabBar.selectedIndex;
}


@end
