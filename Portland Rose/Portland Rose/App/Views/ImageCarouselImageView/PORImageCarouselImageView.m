//
//  PORImageCarouselImageView.m
//  Portland Rose
//
//  Created by Hunter Ford on 09/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORImageCarouselImageView.h"

/// Nib name
static NSString * const NAME_NIB = @"PORImageCarouselImageView";

@interface PORImageCarouselImageView ()
@property (weak, nonatomic) IBOutlet PORImageCardView *viewImageCard;


@end

@implementation PORImageCarouselImageView

- (instancetype) init {
  return  [super initWithNibName: NAME_NIB bundle: [NSBundle bundleForClass:self.class]];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [_viewImageCard setImage: _image];
}


@end
