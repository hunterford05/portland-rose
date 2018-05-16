//
//  PORItinerary+Samples.m
//  Portland Rose
//
//  Created by Hunter Ford on 15/05/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORItinerary+Samples.h"

@implementation PORItinerary (Samples)

#pragma mark - static

+ (PORItineraries *) allSamples{
  return
  @[
    [PORItinerary moonlightWashingtonSquareParkItinerary],
    [PORItinerary picnicOnRooseveltIslandItinerary],
    [PORItinerary eastVillageSpeakeasyTourItinerary],
    [PORItinerary nighthawkCinemaAndCoffeeItinerary],
    [PORItinerary chelseaMarketAndHighLineItinerary]
    ];
}

+ (PORItinerary *) chelseaMarketAndHighLineItinerary{
  PORItinerary * p;
  
  p = [[PORItinerary alloc] init];
  p.activities = @[
                   [PORActivity chelseaMarketActivity],
                   [PORActivity highLineActivity]
                   ];
  p.badges =
  @[
    [PORBadge foodBadge],
    [PORBadge scenicBadge]
    ];
  p.costLower = 25;
  p.costUpper = 100;
  p.duration = 180;
  p.identifier = 0;
  [p addImagesNamed:@[@"high-line-0", @"high-line-1"]];
  p.title = @"Tour Chelsea Market and the Famous High Line";
  
  return p;
}

+ (PORItinerary *) picnicOnRooseveltIslandItinerary{
  PORItinerary * p;
  
  p = [[PORItinerary alloc] init];
  p.activities = @[
                   [PORActivity wholeFoodsShoppingActivity],
                   [PORActivity tramRideToRooseveltIslandActivity],
                   [PORActivity picnicOnRooseveltIslandActivity]
                   ];
  p.badges =
  @[
    [PORBadge scenicBadge]
    ];
  p.costLower = 20;
  p.costUpper = 50;
  p.duration = 180;
  p.identifier = 1;
  [p addImagesNamed:@[@"four-freedoms-0", @"four-freedoms-1", @"four-freedoms-2"]];
  p.title = @"Picnic On Roosevelt Island";
  
  return p;
}

+ (PORItinerary *)eastVillageSpeakeasyTourItinerary{
  PORItinerary * p;
  
  p = [[PORItinerary alloc] init];
  p.activities = @[
                   [PORActivity pdtSpeakeasyActivity],
                   [PORActivity backRoomSpeakeasyActivity]
                   ];
  p.badges =
  @[
    [PORBadge cocktailBadge]
    ];
  p.costLower = 50;
  p.costUpper = 100;
  p.duration = 180;
  p.identifier = 4;
  [p addImagesNamed:@[@"speakeasy-1", @"speakeasy-2", @"speakeasy-0"]];
  p.title = @"East Village Speakeasy Tour";
  
  return p;
}

+ (PORItinerary *)moonlightWashingtonSquareParkItinerary{
  PORItinerary * p;
  
  p = [[PORItinerary alloc] init];
  p.activities = @[
                   [PORActivity flexMusselsActivity],
                   [PORActivity washingtonSquareParkActivity]
                   ];
  p.badges =
  @[
    [PORBadge foodBadge],
    [PORBadge moonBadge]
    ];
  p.costLower = 50;
  p.costUpper = 100;
  p.duration = 180;
  p.identifier = 3;
  [p addImagesNamed:@[@"wsquare-park-0", @"wsquare-park-1"]];
  p.title = @"Moonlight In Greenwich Village";
  
  return p;
}

+ (PORItinerary *)nighthawkCinemaAndCoffeeItinerary {
  PORItinerary * p;
  
  p = [[PORItinerary alloc] init];
  p.activities = @[
                   [PORActivity nightHawkActivity],
                   [PORActivity kobrickCoffeeActivity]
                   ];
  p.badges =
  @[
    [PORBadge movieBadge],
    [PORBadge cocktailBadge],
    [PORBadge coffeeBadge]
    ];
  p.costLower = 75;
  p.costUpper = 100;
  p.duration = 180;
  p.identifier = 2;
  [p addImagesNamed:@[@"cinema-1", @"cinema-0"]];
  p.title = @"Coffee And A Movie — With A Twist!";
  
  return p;
}


#pragma mark - helpers

/**
 * Adds images with the given `names` to this `PORItinerary`
 * instance. The first image given will be the itinerary's
 * `mainImage`.
 */
- (void) addImagesNamed: (NSArray <NSString *> *) names{
  NSMutableArray * a;
  
  self.imageMain = [UIImage imageNamed:names.firstObject];
  a = [[NSMutableArray alloc] init];
  for (int i = 1; i < names.count; i++){
    UIImage * img;
    
    img = [UIImage imageNamed:names[i]];
    NSAssert(img, @"Could not find image named: %@", names[i]);
    [a addObject: img];
  }
  self.imagesSecondary = (NSArray *)a;
}


@end
