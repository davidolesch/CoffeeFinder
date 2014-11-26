//
//  CoffeeFinder.h
//  CoffeeFinder
//
//  Created by David Olesch on 11/25/14.
//  Copyright (c) 2014 David Olesch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

// Capital Factory
// #define userLatitude 30.268994
// #define userLongitude -97.740544

// Cesar Chavez and Waller
#define userLatitude 30.2597008
#define userLongitude -97.7231799

@interface CoffeeFinder : NSObject

+ (void)findCoffeeNear:(CLLocationCoordinate2D)userLocation withCompletionBlock:(void (^)(NSString *placeName))completionBlock;

@end
