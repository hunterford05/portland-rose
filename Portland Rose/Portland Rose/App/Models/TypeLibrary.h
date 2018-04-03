//
//  TypeLibrary.h
//  Portland Rose
//
//  Created by Hunter Ford on 03/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TypeLibrary : NSObject

/// Singleton `TypeLibrary` instance
+ (id) sharedTypeLibrary;

@property UIFont * fontBody;
@property UIFont * fontHeadline;
@property UIFont * fontSubtitle;
@property UIFont * fontTitle;

@end
