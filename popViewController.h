//
//  popViewController.h
//  YelpMikeMap
//
//  Created by user on 8/6/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"

@interface popViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *popUpView;

- (void)showInView:(UIView *)aView animated:(BOOL)animated;
//- (void)removeAnimate;

@property (weak, nonatomic) IBOutlet UIImageView *popImage;

@property (weak, nonatomic) IBOutlet UILabel *popfood;
@property (weak, nonatomic) IBOutlet UILabel *popRadius;


@property (weak,nonatomic) NSString *popURL;
@property (weak,nonatomic) NSString *popRad;
@property (weak,nonatomic) NSString *popFod;

@end
