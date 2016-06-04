//
//  popController.m
//  YelpMikeMap
//
//  Created by user on 8/6/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "popController.h"
#import "matchViewController.h"
#import "ViewController.h"
#import "WebViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "profiler.h"

@interface popController ()

@end

@implementation popController
@synthesize URL;
@synthesize popURL;
@synthesize popSnippet;
@synthesize popURL_ratings;
@synthesize popName;




- (void)viewDidLoad {
   // [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:.6];
    self.popUpView.layer.cornerRadius = 5;
    self.popUpView.layer.shadowOpacity = 0.8;
    self.popUpView.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    ////////////////////////////////////////////////////////
    
    [self.popImage sd_setImageWithURL:[NSURL URLWithString:self.popURL] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    [self.popURL_ratings sd_setImageWithURL:[NSURL URLWithString:self.popURL_rating] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    
    self.snippets.text = popSnippet;
    self.name_text.text = popName;
 
    

     
    
    NSLog(@"pop up window");

    ////////////////////////////////////////////////////////
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)showAnimate
{
    self.view.transform = CGAffineTransformMakeScale(1.3, 1.3);
    self.view.alpha = 0;
    [UIView animateWithDuration:.25 animations:^{
        self.view.alpha = 1;
        self.view.transform = CGAffineTransformMakeScale(1, 1);
    }];
}

- (void)removeAnimate
{
    [UIView animateWithDuration:.25 animations:^{
        self.view.transform = CGAffineTransformMakeScale(1.3, 1.3);
        self.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self.view removeFromSuperview];
            NSLog(@"more can follow");
        }
    }];
}



- (IBAction)closePopup:(id)sender {
    [self removeAnimate];
}
- (IBAction)yelpBtn:(id)sender {
    
    
    /////////////////////////////////////////////////////////////////////////////////
    
    
     
    NSString * storyboardName = @"Main";
    NSString * viewControllerID = @"YelpWeb";
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    WebViewController * controller = (WebViewController *)[storyboard instantiateViewControllerWithIdentifier:viewControllerID];
    
    controller.title = self.popName;
    controller.url = self.url;
    
    [controller setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:controller animated:YES completion:nil];
     
    
    //
    ////////////////////////////////////////////////////////////////////////////////
    
    
}

- (void)showInView:(UIView *)aView animated:(BOOL)animated
{
    [aView addSubview:self.view];
    if (animated) {
        [self showAnimate];
    }
}












/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
