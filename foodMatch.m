//
//  foodMatch.m
//  YelpMikeMap
//
//  Created by user on 7/31/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "foodMatch.h"


@implementation foodMatch


-(NSString *)finialFood:(NSArray *)foodArray1 :(NSArray *)foodArray2
{
    NSString *resultString = @"pizza"; // pizza is defualt
    NSMutableSet *set1 = [NSMutableSet setWithArray: foodArray1];
    NSSet *set2 = [NSSet setWithArray: foodArray2];
    [set1 intersectSet: set2];
    NSArray *resultArray = [set1 allObjects];
    
    
    switch ([resultArray count]) {
        case 0: // no matches
            if ([foodArray1 count] > [foodArray2 count]){
          resultString = [NSString stringWithFormat:@"%@",[foodArray1 objectAtIndex:rand()%[foodArray1 count]]];
            } else {
          resultString = [NSString stringWithFormat:@"%@",[foodArray2 objectAtIndex:rand()%[foodArray2 count]]];
            }
           break;
        case 1: // only one match
            resultString = [NSString stringWithFormat:@"%@",[resultArray objectAtIndex:0]];
            break;
        case 2: // two matches
            resultString = [NSString stringWithFormat:@"%@",[resultArray objectAtIndex:rand()%2]];
            break;
        case 3: // all matches
            resultString = [NSString stringWithFormat:@"%@",[resultArray objectAtIndex:rand()%3]];
            break;
            
        default:
            
            resultString = @"pizza"; // pizza is defualt
            
            break;
    }
    
    return resultString;
}


@end
