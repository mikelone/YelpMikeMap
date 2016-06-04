//
//  ViewController.h
//  YelpMikeMap
//
//  Created by user on 7/29/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "WebViewController.h"
#import "popController.h"



@interface ViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, NSURLConnectionDelegate>

@property   (strong,nonatomic)  popController *showpop;


@property (strong, nonatomic) IBOutlet MKMapView *myMapView;
@property (strong, nonatomic) CLLocationManager *locationManager;

@property (strong, nonatomic) NSMutableData *responseData;



- (IBAction)segmentMapSelection:(id)sender;

- (void) requestDataFromYelpAPI:(MKUserLocation *)userLocation;

//////////////////////////  the parameters for the segue ..
@property (strong, nonatomic) NSString *restaurantName;
@property (strong, nonatomic) NSString* url;
@property (strong, nonatomic) NSString* url_image;
@property (strong, nonatomic) NSString* url_ratings;
@property (strong, nonatomic) NSString* snippet_text;
@property (strong, nonatomic) NSString* menu_text;

@property  (weak,nonatomic) NSString* bestFoods;
@property  (weak,nonatomic) NSString* bestRadius_meters;



@end

