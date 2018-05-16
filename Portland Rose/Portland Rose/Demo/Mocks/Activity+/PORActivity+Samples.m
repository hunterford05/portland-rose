//
//  PORActivity+Samples.m
//  Portland Rose
//
//  Created by Hunter Ford on 16/05/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORActivity+Samples.h"

@implementation PORActivity (Samples)

#pragma mark - class

+ (PORActivity *) backRoomSpeakeasyActivity{
  PORActivity * a = [[PORActivity alloc] init];
  a.costLower = 30;
  a.costUpper = 50;
  a.durationLower = 60;
  a.durationUpper = 90;
  [a setIconWithName: @"icon-cocktail-50"];
  a.isReservationRequired = NO;
  [a setLocationWithTitle: @"102 Norfolk St."];
  a.notes = @"The entrance is hidden: look for a sign that reads THE LOWER EAST SIDE TOY COMPANY; pass through the gate, walk down an alleyway and up a set of stairs; the bar will be on the right.";
  a.recommendations = @"Don't miss monday night jazz.";
  a.subtitle = @"Hidden in a secret alley, The Back Room offers an authentic prohibition-era experience.";
  a.title = @"Step Back in Time at The Back Room";
  a.whatToWear = @"Business casual.";
  return a;
}

+ (PORActivity *)chelseaMarketActivity{
  PORActivity * a = [[PORActivity alloc] init];
  a.costLower = 30;
  a.costUpper = 50;
  a.durationLower = 90;
  a.durationUpper = 120;
  [a setIconWithName: @"icon-cutlery-50"];
  a.isReservationRequired = NO;
  [a setLocationWithTitle: @"Chelsea Market"];
  a.recommendations = @"Los Tacos No. 1 is one of the best taco joints in the city.";
  a.subtitle = @"With more than 35 vendors, Chelsea Market is one of New York’s most notable food halls.";
  a.title = @"Explore Chelsea Market";
  return a;
}

+ (PORActivity *)flexMusselsActivity{
  PORActivity * a = [[PORActivity alloc] init];
  a.costLower = 50;
  a.costUpper = 100;
  a.durationLower = 60;
  a.durationUpper = 90;
  [a setIconWithName: @"icon-cutlery-50"];
  a.isReservationRequired = NO;
  [a setLocationWithTitle: @" 154 W 13th Street"];
  a.subtitle = @"There are, of course, mussels aplenty at Flex Mussels. The menu is, in fact, split into several different categories of the bivalve: white wine, creamy, tomato, and 'flexy' (think Thai and Mexican inspired). The not-mussels section of the menu includes seafood-meets-comfort-food mash-ups like lobster poutine, crab guacamole, and shucked-to-order-then-fried clams.";
  a.title = @"Flex Mussels";
  a.whatToWear = @"Business casual.";
  return a;
}

+ (PORActivity *)highLineActivity{
  PORActivity * a = [[PORActivity alloc] init];
  a.durationLower = 60;
  a.durationUpper = 90;
  [a setIconWithName: @"icon-tree-50"];
  a.isReservationRequired = NO;
  [a setLocationWithTitle: @"The High Line"];
  a.subtitle = @"There’s nothing quite like spending a sunny afternoon on the High Line. NYC's only elevated park is one of Manhattan’s most popular New York attractions, and it's easy to see why.";
  a.title = @"Stroll Along The High Line";
  return a;
}

+ (PORActivity *)kobrickCoffeeActivity{
  PORActivity * a = [[PORActivity alloc] init];
  a.costLower = 30;
  a.costUpper = 50;
  a.durationLower = 45;
  a.durationUpper = 90;
  [a setIconWithName: @"icon-coffee-50"];
  a.isReservationRequired = NO;
  [a setLocationWithTitle: @"24 95th Avenue"];
  a.recommendations = @"The aromatic Mexican Jumping bean is a solid choice.";
  a.subtitle = @"Can’t decide between grabbing coffee or drinks at a bar? Well, why not both!";
  a.title = @"Kobrick Coffee Co.";
  return a;
}

+ (PORActivity *)nightHawkActivity{
  PORActivity * a = [[PORActivity alloc] init];
  a.costLower = 45;
  a.costUpper = 50;
  a.durationLower = 120;
  [a setIconWithName: @"icon-film-50"];
  a.isReservationRequired = NO;
  [a setLocationWithTitle: @"136 Metropolitan Ave."];
  a.subtitle = @"Enjoy a foodie twist on a classic date night activity. This is one of the few movie theaters in N.Y.C. where you can enjoy a meal - or even a drink or two - with your movie.";
  a.title = @"Dinner, Drinks and a Movie at Nighthawk Cinema";
  return a;
}


+ (PORActivity *) pdtSpeakeasyActivity{
  PORActivity * a = [[PORActivity alloc] init];
  a.costLower = 30;
  a.costUpper = 50;
  a.durationLower = 60;
  a.durationUpper = 90;
  [a setIconWithName: @"icon-cocktail-50"];
  a.isReservationRequired = YES;
  [a setLocationWithTitle: @"113 St. Marks Place"];
  a.subtitle = @"Step through a telephone booth and experience one of New York City’s most exclusive speakeasies.";
  a.title = @"Sample Fine Cocktails at P.D.T.";
  a.whatToWear = @"Business casual.";
  return a;
}

+ (PORActivity *) picnicOnRooseveltIslandActivity{
  PORActivity * a = [[PORActivity alloc] init];
  a.durationLower = 60;
  a.durationUpper = 180;
  [a setIconWithName: @"icon-picnic-50"];
  a.isReservationRequired = NO;
  [a setLocationWithTitle: @"Four Freedoms Park"];
  a.subtitle = @"Enjoy views of the Manhattan skyline in a beautiful park.";
  a.title = @"Picnic At Four Freedoms Park";
  a.whatToBring = @" Bring sunblock and a few light layers (in case it gets chilly).";
  return a;
}

+ (PORActivity *) tramRideToRooseveltIslandActivity{
  PORActivity * a = [[PORActivity alloc] init];
  a.costLower = 5;
  a.durationLower = 15;
  a.durationUpper = 30;
  [a setIconWithName: @"icon-tram-50"];
  a.isReservationRequired = NO;
  [a setLocationWithTitle: @"59th Street & 2nd Ave"];
  a.recommendations = @"Try to stand on the left-hand side of the tram for the best views.";
  a.subtitle = @"Take the tram to Roosevelt Island.";
  a.title = @"Tram Ride to Roosevelt Island";
  a.whatToBring = @"Don’t forget to bring your Metrocard!";
  return a;
}

+ (PORActivity *)washingtonSquareParkActivity{
  PORActivity * a = [[PORActivity alloc] init];
  a.durationLower = 30;
  a.durationUpper = 60;
  [a setIconWithName: @"icon-tree-50"];
  a.isReservationRequired = NO;
  [a setLocationWithTitle: @"Washington Square Park"];
  a.subtitle = @"Stroll in the glow of the brilliantly illuminated Washington Square Arch.";
  a.title = @"Washington Square Park";
  a.whatToWear = @"Bring some extra layers in case it gets chilly.";
  return a;
}

+ (PORActivity *) wholeFoodsShoppingActivity{
  PORActivity * a = [[PORActivity alloc] init];
  a.costLower = 15;
  a.costUpper = 45;
  a.durationLower = 20;
  a.durationUpper = 60;
  [a setIconWithName: @"icon-shopping-cart-50"];
  a.isReservationRequired = NO;
  [a setLocationWithTitle: @"226 E 57th St, New York, NY 10022"];
  a.notes = @"Don’t forget to buy napkins, plates, and any other cutlery you’ll need for the picnic.";
  a.recommendations = @"You can’t go wrong with cheese, bread, and sliced meats.";
  a.subtitle = @"Pick out delicious picnic foods at Whole Foods.";
  a.title = @"Shopping At Whole Foods";
  return a;
}


#pragma mark - helpers

/**
 * Sets this `PORActivity` instance's `icon` property
 * to an image with the given name.
 */
- (void) setIconWithName: (NSString *) name{
  [self setIcon:[UIImage imageNamed: name]];
}

/**
 * Sets this `PORActivity` instance's `location` property
 * to a `PORLocation` instance with the given title.
 */
- (void) setLocationWithTitle: (NSString *) title{
  if (!self.location){
    self.location = [[PORLocation alloc] init];
  }
  self.location.title = title;
}

@end
