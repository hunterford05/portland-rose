//
//  PORImageCarouselImageView.h
//  Portland Rose
//
//  Created by Hunter Ford on 09/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PORImageCardView.h"

@interface PORImageCarouselImageView : UIViewController

/// Image to display
@property (nonatomic) IBInspectable UIImage * image;
/// This view's index in its parent `PORImageCarouselView`
@property NSUInteger index;

@end
