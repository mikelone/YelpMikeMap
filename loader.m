//
//  loader.m
//  YelpMikeMap
//
//  Created by user on 8/6/15.
//  Copyright (c) 2015 user. All rights reserved.
//

#import "loader.h"
#import "profiler.h"



@implementation loader

-(NSMutableArray *)loadingData{
    NSMutableArray *gotData = [[NSMutableArray  alloc]init];
    profiler *tmpProfiler = [[profiler  alloc]init];
    
    tmpProfiler.name = [NSString stringWithFormat:@"janedoe"];
    tmpProfiler.distance = [NSString  stringWithFormat:@"5"];
    tmpProfiler.foods = [NSString  stringWithFormat:@"pizza"];
    tmpProfiler.urlString = [NSString  stringWithFormat:@"https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSYDJPeHiM0sT0rNvjhTFr13kMYwAbBZaa8OtCjYuYi372q5wh9"];
    
    [gotData  addObject:tmpProfiler];
    

    
    profiler *tmpProfiler2 = [[profiler  alloc]init];
    
    tmpProfiler2.name = [NSString  stringWithFormat:@"suzy su"];
    tmpProfiler2.distance = [NSString  stringWithFormat:@"4"];
    tmpProfiler2.foods = [NSString  stringWithFormat:@"cuban"];
    tmpProfiler2.urlString = [NSString  stringWithFormat:@"http://img3.etsystatic.com/000/0/5256077/il_fullxfull.197566703.jpg"];
    
    [gotData addObject:tmpProfiler2];
    profiler *tmpProfiler3 = [[profiler  alloc]init];
    
    
    tmpProfiler3.name = [NSString  stringWithFormat:@"janet"];
    tmpProfiler3.distance = [NSString  stringWithFormat:@"3"];
    tmpProfiler3.foods = [NSString  stringWithFormat:@"asian"];
    tmpProfiler3.urlString = [NSString  stringWithFormat:@"http://media.feminis.ro/media/image/201603/full/a_confident_bulgarian_woman_13123300.jpg"];
    
    [gotData addObject:tmpProfiler3];
    profiler *tmpProfiler4 = [[profiler  alloc]init];
    
    
    tmpProfiler4.name = [NSString  stringWithFormat:@"liza"];
    tmpProfiler4.distance = [NSString  stringWithFormat:@"6"];
    tmpProfiler4.foods = [NSString  stringWithFormat:@"asian"];
    tmpProfiler4.urlString = [NSString  stringWithFormat:@"https://graph.facebook.com/picture?type=large&return_ssl_resources=1"];
    
    [gotData addObject:tmpProfiler4];
    
    
    
    
    return gotData;
}





@end
