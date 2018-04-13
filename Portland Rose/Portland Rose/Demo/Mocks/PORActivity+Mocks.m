//
//  PORActivity+Mocks.m
//  Portland Rose
//
//  Created by Hunter Ford on 13/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORActivity+Mocks.h"

/// Comma-separated list of random activity descriptions
static NSString * const DESCRIPTIONS_ACTIVITY = @"Make all your puffin-related dreams come true! You'll see hundreds of puffins and get to see what these amazing creatures are like up close.,Ever wish you could spend more time with puffins? Then this activity is for you! This activity is physically strenuous: you may be huffin' and puffin' by the end.,A romantic afternoon surrounded by adorable puffins.,Feeling spontaneous? This fun-filled puffin experience requires no preparation — just wing it!,Are you and your date curious intellectuals? Take a 'beak' inside the fascinating lives of Icelandic Puffins and become experts on everyone's favorite species of bird.";
/// Comma-separated list of random activity icons
static NSString * const NAMES_ICON_ACTIVITY = @"demo-icon-0,demo-icon-1,demo-icon-2";
/// Comma-separated list of random location names
static NSString * const NAMES_LOCATION_ACTIVITY = @"Snæfellsness,Westman Islands,Vík,Grundarfjörður,Stykkishólmur";
/// Maximum cost of activity (dollars)
static NSUInteger const COST_ACTIVITY_MAX = 200;
/// Maximum duration of activity (minutes)
static NSUInteger const DURATION_ACTIVITY_MAX = 300;
/// Comma-separated list of random notes for activities
static NSString * const NOTES_ACTIVITY = @"Don't feed the puffins.,Don't scare the puffins.,Don't lie down while puffins are flying overhead.,,";
/// Comma-separated list of random titles for activities
static NSString * const TITLES_ACTIVITIY = @"Puffin Watching,Puffin Tour,Sketch Puffins,Photograph Puffins,Puffin Conservation Work";
/// Comma-separated list of random recommendations for activities
static NSString * const RECOMMENDATIONS_ACTIVITY = @"Arrive early.,Arrive late.,,,,";
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
  return [DESCRIPTIONS_ACTIVITY getRandomComponentDelimtedByCommas];
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
