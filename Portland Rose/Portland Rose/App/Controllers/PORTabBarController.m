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

@end

@implementation PORTabBarController

- (void)viewDidLoad {
  [super viewDidLoad];
  CGRect frameTabBar;
  
  frameTabBar = _viewTabBar.frame;
  frameTabBar.size.width = self.view.frame.size.width;
  _viewTabBar.frame = frameTabBar;
  
  [self.view addSubview: _viewTabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
