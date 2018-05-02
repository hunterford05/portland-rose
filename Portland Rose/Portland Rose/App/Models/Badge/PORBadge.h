//
//  PORBadge.h
//  Portland Rose
//
//  Created by Hunter Ford on 12/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PORBadge : NSObject

/// Badge title
@property NSString * title;
/// Badge image
@property UIImage * icon;

- (instancetype) initWithIcon: (UIImage *) icon andTitle: (NSString *) title;

@end
