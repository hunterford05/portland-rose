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
