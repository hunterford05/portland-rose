//
//  PORShowUserController.m
//  Portland Rose
//
//  Created by Hunter Ford on 20/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORShowUserController.h"

/// Opacity for profile picture shadow
static CGFloat const OPACITY_SHADOW_PROFILE = 0.12;
/// Horizontal offset for profile picture shadow
static CGFloat const OFFSET_X_SHADOW_PROFILE = 0;
/// Vertical offset for profile picture shadow
static CGFloat const OFFSET_Y_SHADOW_PROFILE = 5;
/// Ratio between the size of the cover mask and the cover photo itself. Larger values reduce the mask's curvature.
static CGFloat const RATIO_RADIUS_MASK_COVER = 1;
/// Shadow radius for profile picture
static CGFloat const RADIUS_SHADOW_PROFILE = 12;
/// Border width for profile picture
static CGFloat const WIDTH_BORDER_PROFILE = 5;


@interface PORShowUserController ()

/// The user's cover picture
@property (weak, nonatomic) IBOutlet UIImageView *viewImageCover;
/// The user's profile picture
@property (weak, nonatomic) IBOutlet UIImageView *viewImageProfile;
/// Label displaying the user's name
@property (weak, nonatomic) IBOutlet UILabel *viewLabelName;
/// Label displaying the duration of the user's membership
@property (weak, nonatomic) IBOutlet UILabel *viewLabelDurationMembership;

@end

@implementation PORShowUserController


#pragma mark - lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setUp];
}

#pragma mark - helpers

/**
 * `setUp` configures the controller's subviews and initializes its
 * data properties. It is during `viewDidLoad`.
 */
- (void)setUp{
  PORPalette * palette;
  PORTypeLibrary * typeLibrary;
  
  // Initialize palette and type library
  palette = [PORPalette sharedPalette];
  typeLibrary = [PORTypeLibrary sharedTypeLibrary];
  
  // Set view background
  [self.view setBackgroundColor:palette.colorBackground];
  
  // Set up subviews
  [self setUpCover];
  [self setUpLabelsWithPalette:palette andTypeLibrary:typeLibrary];
  [self setUpProfileWithPalette:palette];
}

/**
 * `setUpCover` sets up the user's cover picture subview.
 */
- (void)setUpCover{
  UIImageView * cover;
  CALayer * maskLayer;
  CGFloat inset;
  CGRect maskFrame;
  
  cover = _viewImageCover;
  inset = cover.frame.size.width * -RATIO_RADIUS_MASK_COVER;
  maskFrame = CGRectInset(cover.frame, inset, inset);
  maskFrame.size.height = maskFrame.size.width;
  maskFrame.origin.y = cover.bounds.size.height - maskFrame.size.height;
  maskLayer = [CALayer layer];
  [maskLayer setBackgroundColor:UIColor.clearColor.CGColor];
  [maskLayer setFrame: maskFrame];
  [maskLayer setShadowPath: CGPathCreateWithRoundedRect(maskLayer.bounds, maskFrame.size.width / 2, maskFrame.size.height / 2, nil)];

  [maskLayer setShadowRadius:0];
  [maskLayer setShadowOffset:CGSizeMake(0,0)];
  [maskLayer setShadowColor:UIColor.whiteColor.CGColor];
  [maskLayer setShadowOpacity:1];
  [cover.layer setMask: maskLayer];
}

/**
 * `setUpProfilePictureWithPalette:` sets up the user's profile picture subview.
 */
- (void)setUpProfileWithPalette: (PORPalette *) palette{
  UIImageView * profile;
  CGFloat cornerRadius;
  UIView * shadowView;
  
  // Add corner radius and border
  profile = _viewImageProfile;
  cornerRadius = profile.frame.size.width / 2;
  [profile.layer setCornerRadius: cornerRadius];
  [profile.layer setBorderColor:palette.colorBackground.CGColor];
  [profile.layer setBorderWidth:WIDTH_BORDER_PROFILE];
  
  // Add shadow
  shadowView = [[UIView alloc] initWithFrame:profile.frame];
  [self.view insertSubview:shadowView belowSubview:profile];
  [shadowView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [[shadowView.centerXAnchor constraintEqualToAnchor:profile.centerXAnchor] setActive:YES];
  [[shadowView.centerYAnchor constraintEqualToAnchor:profile.centerYAnchor] setActive:YES];
  [[shadowView.heightAnchor constraintEqualToAnchor:profile.heightAnchor] setActive:YES];
  [[shadowView.widthAnchor constraintEqualToAnchor:profile.widthAnchor] setActive:YES];
  [shadowView.layer setShadowPath:CGPathCreateWithRoundedRect(profile.bounds, cornerRadius, cornerRadius, nil)];
  [shadowView.layer setShadowOpacity: OPACITY_SHADOW_PROFILE];
  [shadowView.layer setShadowColor:UIColor.blackColor.CGColor];
  [shadowView.layer setShadowRadius: RADIUS_SHADOW_PROFILE];
  [shadowView.layer setShadowOffset: CGSizeMake(OFFSET_X_SHADOW_PROFILE, OFFSET_Y_SHADOW_PROFILE)];
}


/**
 * `setUpLabelsWithPalette:andTypeLibrary:` configures all `UILabel` subviews.
 */
- (void)setUpLabelsWithPalette:(PORPalette *)palette andTypeLibrary:(PORTypeLibrary*) typeLibrary{
  [_viewLabelName setFont:typeLibrary.fontSubtitle];
  [_viewLabelDurationMembership setFont:typeLibrary.fontHeadline];
  [_viewLabelDurationMembership setTextColor:palette.colorTextLoud];
  [_viewLabelName setTextColor:palette.colorTextLoud];
}

@end
