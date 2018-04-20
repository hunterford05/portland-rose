//
//  PORActivityCellView.h
//  Portland Rose
//
//  Created by Hunter Ford on 12/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORActivity.h"
#import "PORPalette.h"
#import "PORLabeledIconView.h"
#import "PORTypeLibrary.h"
#import <UIKit/UIKit.h>

@interface PORActivityCellView : UITableViewCell

@property (nonatomic) PORActivity * activity;

+ (NSString *) reuseIdentifier;
+ (NSString *) nibName;

@end
