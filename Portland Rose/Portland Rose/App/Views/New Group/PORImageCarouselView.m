//
//  PORImageCarouselView.m
//  Portland Rose
//
//  Created by Hunter Ford on 09/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORImageCarouselView.h"

@interface PORImageCarouselView ()

@end

@implementation PORImageCarouselView

- (instancetype) initWithCoder:(NSCoder *)coder{
  return [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation: UIPageViewControllerNavigationOrientationHorizontal options: nil];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
}

- (PORImageCarouselImageView *) viewAtIndex: (NSUInteger) index{
  
  if (index > _images.count - 1){
    return nil;
  }
  
  PORImageCarouselImageView * iciv;
  iciv = [[PORImageCarouselImageView alloc] init];
  [iciv setImage: _images[index]];
  [iciv setIndex:index];
  
  return iciv;
}

- (void) setImages:(NSMutableArray *)images {
  _images = images;
  
  PORImageCarouselImageView * iv = [self viewAtIndex:0];
  [self setViewControllers:@[iv] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
  
  [self addChildViewController:iv];
  [iv.view setFrame: self.view.bounds];
  [self.view addSubview: iv.view];
  [iv didMoveToParentViewController:self];
  self.dataSource = self;
}

#pragma mark - UIPageControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
  NSUInteger index;
  
  index = ((PORImageCarouselImageView *) viewController).index;
  
  if (index >= _images.count){
    return nil;
  }
  
  index++;
  return [self viewAtIndex: index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
  NSUInteger index;
  
  index = ((PORImageCarouselImageView *) viewController).index;
  
  if (index == 0){
    return nil;
  }
  
  index--;
  return [self viewAtIndex: index];
}

@end
