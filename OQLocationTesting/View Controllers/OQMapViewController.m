#import "OQMapViewController.h"
#import <MapKit/MapKit.h>

@interface OQMapViewController () <MKMapViewDelegate>

@property (assign, nonatomic) BOOL hasZoomed;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation OQMapViewController

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (self.location) {
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(self.location.latitudeValue, self.location.longitudeValue);
        [self addPinForLocation:coordinate];
        [self zoomToLocation:coordinate];
    } else {
        self.mapView.showsUserLocation = YES;
    }
}

- (void) addPinForLocation:(CLLocationCoordinate2D)coordinate {
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = coordinate;
    [self.mapView addAnnotation:point];
}

- (void) zoomToLocation:(CLLocationCoordinate2D) coordinate {
    if (!self.hasZoomed) {
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 800, 800);
        [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
        self.hasZoomed = YES;
    }
}

#pragma mark - MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    [self zoomToLocation:userLocation.coordinate];
}

@end