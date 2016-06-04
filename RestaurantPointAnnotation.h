//
//  RestaurantPointAnnotation.h
//  YelpMikeMap
//
//  Created by user on 7/29/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface RestaurantPointAnnotation : MKPointAnnotation
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *url_image;
@property (nonatomic, strong) NSString *url_ratings;
@property (nonatomic, strong) NSString *url_snippets;
@property (nonatomic, strong) NSString *url_menu;
//@property (nonatomic, strong) NSString *url;
@end
