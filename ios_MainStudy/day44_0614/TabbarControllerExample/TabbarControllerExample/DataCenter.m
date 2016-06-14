//
//  DataCenter.m
//  TabbarControllerExample
//
//  Created by Sangwook's Macbook on 2016. 6. 14..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter


+(instancetype)sharedInstance{
    static DataCenter *dataCenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[DataCenter alloc]init];
    });
    return dataCenter;
}

@end
