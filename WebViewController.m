//
//  WebViewController.m
//  YelpMikeMap
//
//  Created by user on 7/29/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "WebViewController.h"
#import "ViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"



@interface WebViewController ()

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





@implementation WebViewController




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ////////////////////////////////////////////////////
    

    
    
    
    
    
    
    
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) viewDidAppear:(BOOL)animated {
    [self.myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    

    //  [self.urlStringView sd_setImageWithURL:[NSURL URLWithString:self.url] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
}
- (IBAction)backBtn:(UIBarButtonItem *)sender {
     [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"the view did load");
  //  if (webView.frame  [self.myWebView ]){
 //     [self.myWebView stopLoading];
  //  }
  
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"busy loading");
}


/*
-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
