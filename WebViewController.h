//
//  WebViewController.h
//  YelpMikeMap
//
//  Created by user on 7/29/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>



@property (strong, nonatomic) IBOutlet UIWebView *myWebView;

@property (strong, nonatomic) NSString* url;

@end
