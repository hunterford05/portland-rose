//
//  PORImageCarouselDemoViewController.m
//  Portland Rose
//
//  Created by Hunter Ford on 09/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORImageCarouselDemoViewController.h"

/// Names of demo images
static NSString * const NAMES_IMAGES = @"image-lg-0,image-lg-1,image-lg-2";
/// Name of initial demo image
static NSString * const NAME_IMAGE_INITIAL = @"image-lg-1";

@interface PORImageCarouselDemoViewController ()

/// Container holding the `PORImageCarouselView`
@property (weak, nonatomic) IBOutlet UIView *viewContainerCarousel;
/// `PORImageCarouselView` instance
@property PORImageCarouselView * viewImageCarousel;

@end

@implementation PORImageCarouselDemoViewController

#pragma mark - lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  _viewImageCarousel = self.childViewControllers.firstObject;
  // Set initial image
  [_viewImageCarousel setImages: (NSMutableArray *)@[[UIImage imageNamed:NAME_IMAGE_INITIAL]]];
}

#pragma mark - event handlers
- (IBAction)touchUpInsideButton:(PORActionButtonView *)sender {
  [self loadImages];
}

# pragma mark - helpers

/**
 * Load images named in `NAMES_IMAGES` and supply them to the
 *   `PORImageCarouselView` instance
 */
- (void) loadImages {
  NSArray * names;
  NSMutableArray * imgs;
  
  names = [NAMES_IMAGES componentsSeparatedByString:@","];
  imgs = [[NSMutableArray alloc] init];
  
  for (NSString * name in names){
    [imgs addObject: [UIImage imageNamed:name]];
  }
  
  [_viewImageCarousel setImages: imgs];
}

@end
