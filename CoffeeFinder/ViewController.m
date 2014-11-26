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
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.locationDescriptionLabel.text = @"";
    self.mapView.hidden = YES;
}

- (IBAction)touchedLocateNearbyCoffeeButton:(UIButton *)sender {
    sender.enabled = NO;
    self.locationDescriptionLabel.text = @"";
    self.mapView.hidden = YES;
    [self.searchActivityIndicator startAnimating];
    
    [CoffeeFinder findCoffeeNear:CLLocationCoordinate2DMake(userLatitude, userLongitude) withCompletionBlock:^(MKMapItem *coffeeItem) {
        [self.searchActivityIndicator stopAnimating];
        sender.enabled = YES;
        self.locationDescriptionLabel.text = coffeeItem.name;
        self.mapView.hidden = NO;
        MKCoordinateRegion region = MKCoordinateRegionMake(coffeeItem.placemark.location.coordinate, MKCoordinateSpanMake(0.005f, 0.005f));
        [self.mapView setRegion:[self.mapView regionThatFits:region]];
        [self.mapView removeAnnotations:self.mapView.annotations];
        [self.mapView addAnnotation:coffeeItem.placemark];
    }];
}

@end
