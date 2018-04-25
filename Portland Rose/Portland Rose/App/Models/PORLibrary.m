//
//  PORLibrary.m
//  Portland Rose
//
//  Created by Hunter Ford on 25/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORLibrary.h"

static NSString * const NAME_PERSISTENT_CONTAINER = @"PORData";
static NSString * const ERROR_PERSISTENT_STORE_NOT_LOADED = @"Could not load persistent store. Error: %@";

@interface PORLibrary()

@property NSPersistentContainer * persistentContainer;

@end

@implementation PORLibrary

- (instancetype) initWithCompletionBlock:(void (^)(void))callback{
  
  self = [super init];
  if (!self) {
    return nil;
  }
  
  [self setPersistentContainer:[[NSPersistentContainer alloc] initWithName:NAME_PERSISTENT_CONTAINER]];
  [self.persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription * description, NSError * error) {
    NSAssert(!error, ERROR_PERSISTENT_STORE_NOT_LOADED, error);
    callback();
  }];
  
  return self;
}

@end
