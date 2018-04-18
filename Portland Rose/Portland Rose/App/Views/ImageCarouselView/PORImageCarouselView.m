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

#pragma mark - lifecycle

- (instancetype) init{
  // Always initialize with the correct settings (e.g. scroll transition)
  return [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation: UIPageViewControllerNavigationOrientationHorizontal options: nil];
}

- (instancetype) initWithCoder:(NSCoder *)coder{
  // Always initialize with the correct settings (e.g. scroll transition)
  return [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation: UIPageViewControllerNavigationOrientationHorizontal options: nil];
}

#pragma mark - getters / setters

- (void) setImages:(NSMutableArray *)images {
  // Update `_images`
  _images = images;
  
  // Display the new first image and reset the data source
  PORImageCarouselImageView * iv = [self viewAtIndex:0];
  [self setViewControllers:@[iv] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
  self.dataSource = self;
}

#pragma mark - helpers

/**
 * Returns a `PORImageCarouselImageView` whose image is `_images[index]`
 * and whose `index` is `index`
 */
- (PORImageCarouselImageView *) viewAtIndex: (NSUInteger) index{
  
  // Handle index out of bounds
  if (index > _images.count - 1){
    return nil;
  }
  
  // Initialize, configure, and return the `PORImageCarouselImageView` instance
  PORImageCarouselImageView * iciv;
  iciv = [[PORImageCarouselImageView alloc] init];
  [iciv setImage: _images[index]];
  [iciv setIndex:index];
  return iciv;
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
