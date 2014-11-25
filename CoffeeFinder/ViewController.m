//
//  ViewController.m
//  CoffeeFinder
//
//  Created by David Olesch on 11/25/14.
//  Copyright (c) 2014 David Olesch. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "CoffeeFinder.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *locationDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *searchActivityIndicator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.locationDescriptionLabel.text = @"";
}

- (IBAction)touchedLocateNearbyCoffeeButton:(UIButton *)sender {
    sender.enabled = NO;
    self.locationDescriptionLabel.text = @"";
    [self.searchActivityIndicator startAnimating];
    
    [CoffeeFinder findCoffeeNear:CLLocationCoordinate2DMake(userLatitude, userLongitude) withCompletionBlock:^(NSString *placeName) {
        [self.searchActivityIndicator stopAnimating];
        sender.enabled = YES;
        self.locationDescriptionLabel.text = placeName;
    }];
}

@end
