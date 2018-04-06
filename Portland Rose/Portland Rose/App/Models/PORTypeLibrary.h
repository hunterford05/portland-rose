//
//  PORTypeLibrary.h
//  Portland Rose
//
//  Created by Hunter Ford on 03/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PORTypeLibrary : NSObject

/// Singleton `TypeLibrary` instance
+ (id) sharedTypeLibrary;

/// Font for body text
@property UIFont * fontBody;
/// Font for headline text
@property UIFont * fontHeadline;
/// Font for subtitle text
@property UIFont * fontSubtitle;
/// Font for title text
@property UIFont * fontTitle;

@end
