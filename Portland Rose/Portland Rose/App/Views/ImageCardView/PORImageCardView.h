//
//  PORImageCardView.h
//  Portland Rose
//
//  Created by Hunter Ford on 06/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface PORImageCardView : UIView

/// Image to be displayed
@property (nonatomic) IBInspectable UIImage * image;
/// Blur radius
@property (nonatomic) IBInspectable CGFloat radiusBlur;
/// Blur Y offset
@property (nonatomic) IBInspectable CGFloat offsetYBlur;
/// Image corner radius
@property (nonatomic) IBInspectable CGFloat radiusCorner;

@end
