//
//  PORFloatingActionButtonView.h
//  Portland Rose
//
//  Created by Hunter Ford on 03/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PORActionButtonView.h"
IB_DESIGNABLE

@interface PORFloatingActionButtonView : PORActionButtonView

@property IBInspectable UIColor * colorTint;
@property IBInspectable UIImage * image;
@property IBInspectable CGFloat radius;

@end
