//
//  popController.h
//  YelpMikeMap
//
//  Created by user on 8/6/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"

@interface popController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *popUpView;

- (void)showInView:(UIView *)aView animated:(BOOL)animated;
//- (void)removeAnimate;

@property (weak, nonatomic) IBOutlet UIImageView *popImage;//image_url

@property (weak, nonatomic) IBOutlet UIImageView *popURL_ratings;//rating_img_url
@property (strong, nonatomic) IBOutlet UITextView *snippets;

@property (strong, nonatomic) IBOutlet UILabel *name_text; //name



@property (strong,nonatomic) NSString *URL;
@property (strong,nonatomic) NSString *popURL;
@property (strong,nonatomic) NSString *popSnippet;
@property (strong,nonatomic) NSString *popURL_rating;
@property (strong, nonatomic) NSString *popName;




@property (weak, nonatomic)  NSString *url; //url



@end
