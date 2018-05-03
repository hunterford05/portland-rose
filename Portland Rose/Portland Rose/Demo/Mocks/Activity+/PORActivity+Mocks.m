//
//  PORActivity+Mocks.m
//  Portland Rose
//
//  Created by Hunter Ford on 13/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORActivity+Mocks.h"

/// Semicolon-separated list of random activity descriptions
static NSString * const DESCRIPTIONS_ACTIVITY = @"What's that? Is that love in the air? No, those are just pigeons.;Romance? Check. Excitement? Of course. Overpriced lattes? Bien sur! Yessiree, this activity has it all.;Good eats and great views are guaranteed. How good's the company? That part is up to you!;This little number has a little bit of everything that New York City has to offer.;Beauty, style, and class: if you're looking for any of those, better try something else.;Roses are red. Violets are blue. You'll love this activity, and your date will too!;Spend an hour here and your spirits will be as light as your wallet!;Looking to spend your entire life savings in one afternoon? No? Well you can do that here anyway.";
/// Comma-separated list of random activity icons
static NSString * const NAMES_ICON_ACTIVITY = @"demo-icon-0,demo-icon-1,demo-icon-2,demo-icon-3,demo-icon-4,demo-icon-5,demo-icon-6";
/// Comma-separated list of random location names
static NSString * const NAMES_LOCATION_ACTIVITY = @"Midtown,Harlem,Washington Heights,Inwood,Battery Park,Greenwich Village,Chinatown,Koreatown,Little Italy,Yorktown,Upper East Side,Chelsea,West Village,ABC City,Lower East Side,Bowery,SoHo,NoHo,West Village,Meatpacking District,Tribeca,Civic Center,White Hall,Wall Street,Gramercy Park,Midtown South,Lincoln Square,Morningside Heights,Hamilton Heights";
/// Maximum cost of activity (dollars)
static NSUInteger const COST_ACTIVITY_MAX = 200;
/// Maximum duration of activity (minutes)
static NSUInteger const DURATION_ACTIVITY_MAX = 300;
/// Comma-separated list of random notes for activities
static NSString * const NOTES_ACTIVITY = @"Don't feed the pigeons,Don't take the subway after 1am,Watch out for your valuables,Don't eat the cottage cheese,,,,";
/// Comma-separated list of random titles for activities
static NSString * const TITLES_ACTIVITIY = @"Picnic at Gramercy Park,Picnic at Central Park,Picnic at Four Freedoms Park,Visit The Cloisters,Take the Roosevelt Island Tram,Beers at Heidelberg,Beers at Radegast,Shopping at Tiffany's,Shopping at Muji,Shopping at Sunset Mart,Bike the Hudson River greenway,Silent Disco,Le Bain,Halal Guys,New York Public Library,Sleepover at AMNH,Cat Cafe,Sketching in Central Park,Harlem Jazz,Brooklyn Beer Binging,Soju Shots in SoHo,Whiskey in Whitehall,Meatpacking Mezcal Meetup,Tequila Time in Tribeca,Champagne in Chinatown,Hamilton Heights Hennessy";
/// Comma-separated list of random recommendations for activities
static NSString * const RECOMMENDATIONS_ACTIVITY = @"Arrive early,Arrive late,,,,";
/// Comma-separated list of random items to bring to an activity
static NSString * const WHAT_TO_BRING_ACTIVITY = @"Bring binoculars and a camera,Bring a childlike sense of wonder,Bring a journal,,,";
/// Comma-separated list of what to wear
static NSString * const WHAT_TO_WEAR_ACTIVITY = @"Bring a jacket — it gets cold!,Bring good hiking shoes — and make sure your date does too.,Wear black tie,Wear white tie,,,";



@implementation PORActivity (Mocks)

#pragma mark - class

+ (PORActivity *)mock {
  PORActivity * activity;
  
  activity = [[PORActivity alloc] init];
  activity.costLower = [activity getRandomCostLower];
  activity.costUpper = [activity getRandomCostUpper];
  activity.durationLower = [activity getRandomDurationLower];
  activity.durationUpper = [activity getRandomDurationUpper];
  activity.icon = [activity getRandomIcon];
  activity.isReservationRequired = [activity getRandomIsReservationRequired];
  activity.location = [activity getRandomLocation];
  activity.notes = [activity getRandomNotes];
  activity.recommendations = [activity getRandomRecommendations];
  activity.subtitle = [activity getRandomDescription];
  activity.title = [activity getRandomTitle];
  activity.whatToWear = [activity getRandomWhatToWear];
  activity.whatToBring = [activity getRandomWhatToBring];

  return activity;
}

+ (NSArray<PORActivity *> *)mocks:(NSUInteger)n{
  NSMutableArray * ma;
  
  ma = [[NSMutableArray alloc] initWithCapacity:n];
  for (int i = 0; i < n; i++){
    [ma addObject:[PORActivity mock]];
  }
  return [[NSArray alloc] initWithArray:ma];
}


#pragma mark - instance

- (NSUInteger) getRandomCostLower {
  return [NSNumber getRandomUnsignedIntegerLessThan:COST_ACTIVITY_MAX];
}

- (NSUInteger)getRandomCostUpper{
  return [self getRandomCostLower];
}

- (NSString *)getRandomDescription{
  return [DESCRIPTIONS_ACTIVITY getRandomComponentDelimtedBy:@";"];
}

- (NSUInteger) getRandomDurationLower {
  return [NSNumber getRandomUnsignedIntegerLessThan: DURATION_ACTIVITY_MAX];
}

- (NSUInteger)getRandomDurationUpper{
  return [self getRandomDurationLower];
}

- (UIImage *)getRandomIcon{
  UIImage * img;
  NSString * name;
  
  name = [NAMES_ICON_ACTIVITY getRandomComponentDelimtedByCommas];
  img = [UIImage imageNamed:name];
  NSAssert(img, @"no image named %@", name);
  return img;
}

- (PORLocation *)getRandomLocation{
  PORLocation * location =  [[PORLocation alloc] init];
  location.title = [NAMES_LOCATION_ACTIVITY getRandomComponentDelimtedByCommas];
  return location;
}

- (BOOL) getRandomIsReservationRequired{
  return [NSNumber getRandomUnsignedIntegerLessThan:2] == 1;
}

- (NSString *)getRandomNotes{
  return [NOTES_ACTIVITY getRandomComponentDelimtedByCommas];
}

- (NSString *) getRandomRecommendations{
  return [RECOMMENDATIONS_ACTIVITY getRandomComponentDelimtedByCommas];
}

- (NSString *) getRandomTitle{
  return [TITLES_ACTIVITIY getRandomComponentDelimtedByCommas];
}

- (NSString *) getRandomWhatToBring{
  return [WHAT_TO_BRING_ACTIVITY getRandomComponentDelimtedByCommas];
}

- (NSString *) getRandomWhatToWear{
  return [WHAT_TO_WEAR_ACTIVITY getRandomComponentDelimtedByCommas];
}

@end
