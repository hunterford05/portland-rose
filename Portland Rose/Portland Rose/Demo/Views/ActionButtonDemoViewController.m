//
//  ActionButtonDemoViewController.m
//  Portland Rose
//
//  Created by Hunter Ford on 03/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "ActionButtonDemoViewController.h"
#import "ActionButtonView.h"

@interface ActionButtonDemoViewController ()
@property (weak, nonatomic) IBOutlet ActionButtonView *btn;

@end

@implementation ActionButtonDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)touchUp:(id)sender {
  NSLog(@"Touchup!");
}



@end
