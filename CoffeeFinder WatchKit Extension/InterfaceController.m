//
//  InterfaceController.m
//  CoffeeFinder WatchKit Extension
//
//  Created by David Olesch on 11/25/14.
//  Copyright (c) 2014 David Olesch. All rights reserved.
//

#import "InterfaceController.h"
#import "CoffeeFinder.h"

@interface InterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *locationDescriptionLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceButton *locateNearbyCoffeeButton;

@end


@implementation InterfaceController

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        NSLog(@"%@ initWithContext", self);
        [self.locationDescriptionLabel setText:@""];
        
    }
    return self;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    NSLog(@"%@ will activate", self);
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    NSLog(@"%@ did deactivate", self);
}

- (IBAction)touchedLocateNearbyCoffee {
    [self.locationDescriptionLabel setText:@"Loading.."];
    [self.locateNearbyCoffeeButton setEnabled:NO];
    [CoffeeFinder findCoffeeNear:CLLocationCoordinate2DMake(userLatitude, userLongitude) withCompletionBlock:^(NSString *placeName) {
        [self.locationDescriptionLabel setText:placeName];
        [self.locateNearbyCoffeeButton setEnabled:YES];
    }];
}

@end



