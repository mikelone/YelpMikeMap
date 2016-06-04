//
//  matchTableViewCell.h
//  YelpMikeMap
//
//  Created by user on 8/6/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface matchTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *foods;
@property (weak, nonatomic) IBOutlet UIImageView *mainThumb;
@end
