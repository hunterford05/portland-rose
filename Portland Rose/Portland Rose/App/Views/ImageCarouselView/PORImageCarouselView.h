//
//  PORImageCarouselView.h
//  Portland Rose
//
//  Created by Hunter Ford on 18/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORImageCardView.h"
#import <UIKit/UIKit.h>

IB_DESIGNABLE

@class PORImageCarouselView;

@protocol PORImageCarouselDelegate
- (void) imageCarouselView: (PORImageCarouselView *) carouselView didChangeIndex: (NSUInteger) index;
@end

@interface PORImageCarouselView : UIView <UIScrollViewDelegate>

/// Delegate
@property id <PORImageCarouselDelegate> delegate;
/// Images to be displayed
@property (nonatomic) NSArray <UIImage *> * images;
/// Current index
@property (nonatomic) NSUInteger index;

@end


