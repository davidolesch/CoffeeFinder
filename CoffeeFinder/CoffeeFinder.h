//
//  CoffeeFinder.h
//  CoffeeFinder
//
//  Created by David Olesch on 11/25/14.
//  Copyright (c) 2014 David Olesch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CoffeeFinder : NSObject

+ (void)findCoffeeNear:(CLLocationCoordinate2D)userLocation withCompletionBlock:(void (^)(NSString *placeName))completionBlock;

@end
