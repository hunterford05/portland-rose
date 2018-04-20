//
//  PORItinerary+Mocks.m
//  Portland Rose
//
//  Created by Hunter Ford on 12/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORItinerary+Mocks.h"

/// Maximum random cost (dollars)
static NSUInteger const COST_MAX = 250;
/// Maximum number of random activities
static NSUInteger const COUNT_ACTIVITIES_MAX = 5;
/// Maximum number of random badges
static NSUInteger const COUNT_BADGES_MAX = 5;
/// Maximum number of images
static NSUInteger const COUNT_IMAGES_MAX = 5;
/// Maximum random duration (minutes)
static NSUInteger const DURATION_MAX = 300;
/// Comma-delimted list of possible mock image filenames
static NSString * const NAMES_IMAGE_MOCK = @"image-lg-0,image-lg-1,image-lg-2";
/// Comma-delimited list of possible mock titles
static NSString * const TITLES_MOCK = @"Puffin Watching In Snæfellsness,Puffin Petting Zoo,Puffinpalooza Music Festival,Puffins Up Close,Puffin Tour: Westman Islands";


@implementation PORItinerary (Mocks)

+ (PORItinerary *) mock {
  PORItinerary * itinerary;
  
  itinerary = [[PORItinerary alloc] init];
  itinerary.title = [itinerary getRandomTitle];
  itinerary.imageMain = [itinerary getRandomImage];
  itinerary.imagesSecondary = [itinerary getRandomSecondaryImages];
  itinerary.costLower = [itinerary getRandomCostLower];
  itinerary.costUpper = [itinerary getRandomCostUpper];
  itinerary.duration = [itinerary getRandomDuration];
  itinerary.badges = [itinerary getRandomBadges];
  itinerary.activities = [itinerary getRandomActivities];
  
  return itinerary;
}

+ (NSArray *) mocks:(NSUInteger)n {
  NSMutableArray * a;
  
  a = [[NSMutableArray alloc] init];
  for (int i = 0; i < n; i++){
    [a addObject: [PORItinerary mock]];
  }
  
  return [[NSArray alloc] initWithArray: a];
}

#pragma mark - helpers

- (NSArray <PORActivity *> *)getRandomActivities{
  return [PORActivity mocks: [NSNumber getRandomUnsignedIntegerLessThan:COUNT_ACTIVITIES_MAX] + 1];
}


- (NSArray <PORBadge *> *) getRandomBadges{
  return [PORBadge mocks: [NSNumber getRandomUnsignedIntegerLessThan:COUNT_BADGES_MAX]];
}

- (NSUInteger) getRandomCostLower{
  return [NSNumber getRandomUnsignedIntegerLessThan: COST_MAX];
}

- (NSUInteger) getRandomCostUpper{
  return [self getRandomCostLower];
}


- (NSUInteger) getRandomDuration{
  return [NSNumber getRandomUnsignedIntegerLessThan: DURATION_MAX];
}

- (UIImage *) getRandomImage{
  UIImage * img;
  NSString * name;
  
  name = [NAMES_IMAGE_MOCK getRandomComponentDelimtedByCommas];
  img = [UIImage imageNamed: name];
  NSAssert(img, @"no image named '%@'", name);
  
  return img;
}

- (UIImage *) getRandomMainImage {
  return [self getRandomImage];
}

- (NSArray <UIImage *> *) getRandomSecondaryImages {
  NSUInteger count;
  NSMutableArray <UIImage *> * images;
  
  count = [NSNumber getRandomUnsignedIntegerLessThan: COUNT_IMAGES_MAX];
  images = [[NSMutableArray alloc] initWithCapacity:count];
  for (int i = 0; i < count; i++){
    [images addObject:[self getRandomImage]];
  }
  
  return [[NSArray <UIImage *> alloc] initWithArray:images];
}

- (NSString *) getRandomTitle{
  return [TITLES_MOCK getRandomComponentDelimtedByCommas];
}

@end
