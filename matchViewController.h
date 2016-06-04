//
//  matchViewController.h
//  YelpMikeMap
//
//  Created by user on 8/6/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "popViewController.h"


@interface matchViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>


@property   (strong,nonatomic)  popViewController *showpop;


//-(void) segueToMap;

@end
