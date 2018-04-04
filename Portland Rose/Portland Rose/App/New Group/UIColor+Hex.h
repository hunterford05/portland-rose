//
//  UIColor+Hex.h
//  Portland Rose
//
//  Created by Hunter Ford on 03/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *) colorWithHexString: (NSString *) hexString;
+ (UIColor *) colorWithHexString: (NSString *) hexString alpha: (CGFloat) alpha;


@end
