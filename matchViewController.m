//
//  matchViewController.m
//  YelpMikeMap
//
//  Created by user on 8/6/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "matchViewController.h"
#import "matchTableViewCell.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "ViewController.h"
#import "loader.h"
#import "profiler.h"


@interface matchViewController ()
@property   (strong,nonatomic) NSMutableArray *arrayData;
//@property   (weak,nonatomic) UIView *view
@end

@implementation matchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    loader *loadDatax  = [[loader  alloc]init];
    // [self.arrayData addObjectsFromArray:loadDatax.loadingData];
    self.arrayData = loadDatax.loadingData;
    NSLog(@"arrays1 is %li",(unsigned long)[self.arrayData count]);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // self.resturantArray = ;
    NSLog(@"# arrays are %li",(unsigned long)[self.arrayData count]);
    return [self.arrayData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    matchTableViewCell *cell = (matchTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"matchViewCell"];
    
    profiler *profilerObj = (profiler *)[self.arrayData objectAtIndex:indexPath.row];
    
    
    /*
     @property  (weak,nonatomic) NSString *name;
     @property  (weak,nonatomic) NSString *distance;
     @property  (weak,nonatomic) NSString *foods;
     //@property (weak, nonatomic) NSString *mainImage;
     @property (weak, nonatomic) NSString *urlString;
     */
    
    
    cell.nameLabel.text = profilerObj.name;
    cell.foods.text = profilerObj.foods;
    cell.distanceLabel.text = profilerObj.distance;
    
    [cell.mainThumb sd_setImageWithURL:[NSURL URLWithString:profilerObj.urlString] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
   // [self.tableView reloadData];
    
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    profiler *profilerObj = (profiler *)[self.arrayData  objectAtIndex:indexPath.row];
  /*
    NSString *popURL;
    NSString *popRad;
    NSString *popFod;
     showInView:(UIView *)aView animated:(BOOL)animated;
   IBOutlet UIView *popUpView;
   */
    self.showpop = [[popViewController alloc]initWithNibName:@"popupView" bundle:nil];
    self.showpop.popURL = profilerObj.urlString;
    self.showpop.popRad = profilerObj.distance;
    self.showpop.popFod = profilerObj.foods;
    [self.showpop showInView:self.view animated:YES];
    
    
    
    //   if (restaurantObj.yelpURL) {
    //       UIApplication *app = [UIApplication sharedApplication];
    //       [app openURL:[NSURL URLWithString:restaurantObj.yelpURL]];
    //  }
}
///////////////////////////////////////////////////////////////////////////////////////
/*
 @property  (strong,nonatomic) NSString* bestFoods;
 @property  (strong,nonatomic) NSString* bestRadius_meters;


*/

/*
-(void) segueToMap{
    [self.showpop removeAnimate];
 //   NSString * storyboardName = @"Main";
    NSString * viewControllerID = @"YelpkMap";
 //   UIStoryboard * storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
  //  ViewController * controller = (ViewController *)[storyboard instantiateViewControllerWithIdentifier:viewControllerID];
    
    
    ViewController *controller = (ViewController *)[self.storyboard   instantiateViewControllerWithIdentifier:viewControllerID];
    
    controller.bestFoods = self.showpop.popFod;
    controller.bestRadius_meters = self.showpop.popRad;
    
    
    [self presentViewController:controller animated:YES completion:nil];

}
 */
 
 
 
 
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
