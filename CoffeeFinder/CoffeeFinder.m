//
//  CoffeeFinder.m
//  CoffeeFinder
//
//  Created by David Olesch on 11/25/14.
//  Copyright (c) 2014 David Olesch. All rights reserved.
//

#import "CoffeeFinder.h"

@implementation CoffeeFinder

+ (void)findCoffeeNear:(CLLocationCoordinate2D)userLocation withCompletionBlock:(void (^)(NSString *))completionBlock
{
    // Create request
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = @"Coffee";
    request.region = MKCoordinateRegionMakeWithDistance(userLocation, 1000, 1000);
    
    // Perform search
    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:request];
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        NSUInteger randomIndex = arc4random_uniform((int)response.mapItems.count);
        MKMapItem *randomItem = [response.mapItems objectAtIndex:randomIndex];
        if (completionBlock) {
            completionBlock([randomItem name]);
        }
    }];
}

@end
