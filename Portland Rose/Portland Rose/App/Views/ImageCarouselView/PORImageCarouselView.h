//
//  PORImageCarouselView.h
//  Portland Rose
//
//  Created by Hunter Ford on 09/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PORImageCarouselImageView.h"

IB_DESIGNABLE

@interface PORImageCarouselView : UIPageViewController <UIPageViewControllerDataSource>

/// Array of images to display in the carousel
@property (nonatomic) NSMutableArray * images;

@end
