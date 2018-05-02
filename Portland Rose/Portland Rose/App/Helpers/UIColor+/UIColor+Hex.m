//
//  UIColor+Hex.m
//  Portland Rose
//
//  Created by Hunter Ford on 03/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *) colorWithHexString:(NSString *)hexString alpha:(CGFloat) alpha{
  unsigned rgbValue = 0;
  NSScanner * scanner = [NSScanner scannerWithString:hexString];
  if ([hexString hasPrefix:@"#"]){
    [scanner setScanLocation: 1];
  }
  [scanner scanHexInt:&rgbValue];
  return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha: alpha];
}

+ (UIColor *) colorWithHexString:(NSString *)hexString {
  return [UIColor colorWithHexString:hexString alpha: 1.0];
}

@end
