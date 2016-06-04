//
//  ViewController.m
//  YelpMikeMap
//
//  Created by user on 7/29/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"
#import "RestaurantPointAnnotation.h"
#import "YPAPISample.h"
#import "OAConsumer.h"
#import "OAToken.h"
#import "OAMutableURLRequest.h"
#import "NSURLRequest+OAuth.h"
#import "tokens.h"
#import "foodMatch.h"


static NSString * const kConsumerKey       = OAUTH_CONSUMER_KEY;
static NSString * const kConsumerSecret    = OAUTH_CONSUMER_SECRET;
static NSString * const kToken             = OAUTH_TOKEN;
static NSString * const kTokenSecret       = OAUTH_TOKEN_SECRET;
BOOL userLocationShown = NO;

@interface ViewController ()

@end




@implementation UINavigationController (Orientation)

-(NSUInteger)supportedInterfaceOrientations
{
    return [self.topViewController supportedInterfaceOrientations];
}

-(BOOL)shouldAutorotate
{
    return NO;
}

@end




@implementation ViewController

@synthesize bestFoods;
@synthesize bestRadius_meters;




-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.locationManager = [[CLLocationManager alloc]init];
    [self.locationManager setDelegate:self];
   
        // Use one or the other, not both. Depending on what you put in info.plist
        //[self.locationManager requestAlwaysAuthorization];
        [self.locationManager requestWhenInUseAuthorization];
   
    
    self.myMapView.delegate = self;
    self.myMapView.showsUserLocation = YES;
    [self.myMapView setMapType:MKMapTypeStandard];
    [self.myMapView setZoomEnabled:YES];
    [self.myMapView setScrollEnabled:YES];
/////////////////////////////////////////////////////////////////////////////
    NSLog(@"bestfood %@ and radius %@",self.bestFoods,self.bestRadius_meters);
    if (self.bestFoods == nil) {
        self.bestFoods = @"pizza";
    }
    
    NSArray *foodMatch1 = @[self.bestFoods,@"greek",@"latin"];//user parse info
    NSArray *foodMatch2 = @[@"pizza",@"asian",@"cuban"];//user parse info
    
    
    foodMatch *yum = [[foodMatch alloc]init];
    
    self.bestFoods = [yum finialFood:foodMatch1 :foodMatch2];
    NSLog(@"food match %@,%@",self.bestFoods,[yum finialFood:foodMatch1 :foodMatch2]);
    

////////////////////////////////////////////////////////////////////////////
    NSLog(@"food match %@",self.bestFoods);

}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)segmentMapSelection:(id)sender {
    
    switch (((UISegmentedControl*)sender).selectedSegmentIndex) {
        case 0:
            self.myMapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.myMapView.mapType = MKMapTypeHybrid;
            break;
        case 2:
            self.myMapView.mapType = MKMapTypeSatellite;
            break;
    }
}


-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    //Everytime the location gets updated, we start from a clean mapview - clear out all annotations
    
    if(userLocationShown == YES) return;
    //
    [mapView removeAnnotations:mapView.annotations];
    NSLog(@"didUpdateUserLocation just got called!");
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.location.coordinate, 5000, 5000);
    //you can set zoom to 50000 on each to make it nicely zoomed out
    [self.myMapView setRegion:region animated:YES];
    [self requestDataFromYelpAPI:userLocation];
    
    userLocationShown = YES;

}



-(void)requestDataFromYelpAPI:(MKUserLocation *)userLocation {
    CLGeocoder *clgeocoder = [[CLGeocoder alloc]init];
    [clgeocoder geocodeAddressString:@"TurnToTech, New York, NY" completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        }
        else {
            
            //Location Version
            //            NSString *location = @"flatiron%20NY";
            //            //note that spaces can't be directly substitued into the URL because it will break the URL
            //            //%20 denotes spaces
            //            NSString *address = [[NSString alloc]initWithFormat:@"http://api.yelp.com/v2/search?term=%@&location=%@&limit=%@", term, location, searchLimit];
            
            //Configuration
        NSString  *term = [[NSString alloc]init ];
        NSString *radiusFilter = [[NSString alloc] init];
            

            if (self.bestFoods == nil) {
                term = @"pizza";
            } else {
                term = [NSString stringWithString:self.bestFoods];
            }
            if (self.bestRadius_meters == nil) {
              radiusFilter = @"1000";
            } else {
              radiusFilter = [NSString  stringWithFormat:@"%@",[NSNumber numberWithDouble:[self.bestRadius_meters doubleValue]*1600*3]];
            }
         
            //NSString *term = self.bestFoods;
       //     NSString  *term = @"pizza";

            NSString *searchLimit= @"10";
            
            NSString *address = [[NSString alloc]initWithFormat:@"http://api.yelp.com/v2/search?term=%@&ll=%f,%f&radius_filter=%@&limit=%@", term, userLocation.coordinate.latitude, userLocation.coordinate.longitude,radiusFilter, searchLimit];
            
            NSURL *URL = [NSURL URLWithString:address];
            //Some boiler plate code to make with OAuth
            
            
            OAConsumer *consumer = [[OAConsumer alloc] initWithKey:kConsumerKey secret:kConsumerSecret];
            //Generates the key we pass for OAuth
            OAToken *token = [[OAToken alloc] initWithKey:kToken secret:kTokenSecret];
            //Generates the token we pass for OAuth
            id<OASignatureProviding, NSObject> provider = [[OAHMAC_SHA1SignatureProvider alloc] init];
            //Encypts the key & token to send it over the Internet
            OAMutableURLRequest *request = [[OAMutableURLRequest alloc] initWithURL:URL consumer:consumer token:token realm:nil signatureProvider:provider];
            //Makes the URL request for our url with key, token and other info we set
            [request prepare];
            //OAuth boilerplate
            
            self.responseData = [[NSMutableData alloc] init];
            //Allocates the NSData object that will handle our asynchronous request
            NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self]; //This is the part we make (fire) url request
        }
    }];
    
}




#pragma mark NSURLConnection Delegate Methods


- (void) connection:(NSURLConnection* )connection didReceiveResponse:(NSURLResponse *)response {
    //this handler, gets hit ONCE
}

- (void)connection: (NSURLConnection *)connection didReceiveData:(NSData *) data {
    //this handler, gets hit SEVERAL TIMES
    [self.responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse {
    //Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    //this handler gets hit ONCE
    // The request is complete and data has been received
    // You can parse the stuff in your data variable now or do whatever you want
    
    NSLog(@"connection finished");
    NSLog(@"Succeeded! Received %lu bytes of data",(unsigned long)[self.responseData length]);
    
    [self turnDataIntoWorkableJSONAndDropAnnotationsOnMapView:self.responseData];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
}

- (void) turnDataIntoWorkableJSONAndDropAnnotationsOnMapView:(NSMutableData *) responseData {
    //Convert your responseData object
    NSError *myError = nil;
    NSDictionary *responseDataInNSDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:&myError];

NSLog(@"responseDataInNSDictionary = %@", responseDataInNSDictionary);
    
    if (myError) {
        NSLog(@"error: %@", myError);
        
        return;
    }
    else {
        NSArray *resultsArray = [responseDataInNSDictionary objectForKey:@"businesses"];
               NSLog(@"%@", resultsArray);
        
        for (int i = 0; i < resultsArray.count; i++) {
            NSDictionary *restaurantObject = resultsArray[i];
            NSString *restaurantName = [restaurantObject objectForKey:@"name"];
            NSDictionary *locationObject = [restaurantObject objectForKey:@"location"];
            NSDictionary *coordinateObject = [locationObject objectForKey:@"coordinate"];
            double latitude = [[coordinateObject objectForKey:@"latitude"] doubleValue];
            double longitude = [[coordinateObject objectForKey:@"longitude"] doubleValue];
            CLLocationCoordinate2D restaurantCoordinate = CLLocationCoordinate2DMake(latitude, longitude);
            RestaurantPointAnnotation *annotation = [[RestaurantPointAnnotation alloc]init];
            [annotation setCoordinate:restaurantCoordinate];
            [annotation setTitle:restaurantName];
            //[annotation setUrl_image:@"hola"];
            [self.myMapView addAnnotation:annotation];
            
            NSString *yelpURL = [restaurantObject objectForKey:@"url"];
            annotation.url = yelpURL;
            NSString *yelpURLimage = [restaurantObject objectForKey:@"image_url"];
            annotation.url_image = yelpURLimage;
            NSString *yelpURLRatings = [restaurantObject objectForKey:@"rating_img_url"];
            annotation.url_ratings = yelpURLRatings;
            NSString *yelpURLsnip = [restaurantObject objectForKey:@"snippet_text"];
            annotation.url_snippets = yelpURLsnip;

            NSLog(@"%@", restaurantName);
        }
        
    }
}
 

/////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    else if ([annotation isKindOfClass:[RestaurantPointAnnotation class]]) {
        MKAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"loc"]; //loc
        annotationView.canShowCallout = YES;
     NSLog(@"  pin is activated ");
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        return annotationView;
    }
    else {
        MKAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"loc"]; //loc
        annotationView.canShowCallout = YES;
             NSLog(@"  pin2 is activated ");
        return annotationView;
    }
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    RestaurantPointAnnotation *thisAnnotation = (RestaurantPointAnnotation *) view.annotation;
    self.restaurantName = thisAnnotation.title;
    self.url = thisAnnotation.url;
    self.url_image = thisAnnotation.url_image;
    self.url_ratings = thisAnnotation.url_ratings;
    self.snippet_text = thisAnnotation.url_snippets;
    
    
    NSLog(@" the annotation was pressed");
    
 //   [self performSegueWithIdentifier:@"webViewSegue" sender:self];

    self.showpop = [[popController alloc]initWithNibName:@"popup" bundle:nil];
    self.showpop.url = self.url;
    self.showpop.popURL = self.url_image;
    self.showpop.popURL_rating = self.url_ratings;
    self.showpop.popName = self.restaurantName;
    self.showpop.popSnippet = self.snippet_text;
    [self.showpop showInView:self.view animated:YES];
    
    
}
///////////////////////////////////////////////////////////////////////////////////////
/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
WebViewController *webVC = [segue destinationViewController];
    webVC.title = self.restaurantName;
    webVC.name_text = self.restaurantName;
    webVC.url = self.url; // image_url
    webVC.url_ratings = self.url_ratings;
    webVC.snippet_text = self.snippet_text;
    webVC.menu_text = self.menu_text;
    
    NSLog(@"%@",self.url);
    //////////////////////////////////////////////////////////////////////////////
    
    NSLog(@" should segue out ");
}

*/

//////////////////////////////////////////////////////////////////////////////////////
/*
-(void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
   // MKAnnotationView *ulv = [mapView viewForAnnotation:mapView.userLocation];
   // ulv.enabled = NO;
}
*/

-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    NSLog(@"region changed");
    
    if (userLocationShown == YES){
        if (fabs(self.myMapView.userLocation.coordinate.latitude - self.myMapView.centerCoordinate.latitude) > .01  || fabs(self.myMapView.userLocation.coordinate.longitude - self.myMapView.centerCoordinate.longitude) > .01 )
        {
            userLocationShown = NO;
        }
        
    }
    
    NSLog(@"---- %f",self.myMapView.userLocation.coordinate.latitude);
    NSLog(@"---- %f",self.myMapView.centerCoordinate.latitude);
    
    NSLog(@"---- %f",self.myMapView.userLocation.coordinate.longitude);
    NSLog(@"---- %f",self.myMapView.centerCoordinate.longitude);
    
    
}
- (IBAction)backBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
