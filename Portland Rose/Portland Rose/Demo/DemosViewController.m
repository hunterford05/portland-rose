//
//  DemosViewController.m
//  Portland Rose
//
//  Created by Hunter Ford on 02/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "DemosViewController.h"

@interface DemosViewController ()

@end

@implementation DemosViewController

NSString * const TITLE = @"Demos";

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self setTitle:TITLE];
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
