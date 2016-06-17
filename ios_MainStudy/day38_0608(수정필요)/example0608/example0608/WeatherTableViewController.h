//
//  WeatherTableViewController.h
//  example0608
//
//  Created by Mookie on 2016. 6. 8..
//  Copyright © 2016년 Mookie. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, WeatherType){
    WeatherTypeKorea = 0,
    WeatherTypeWorld
};

@interface WeatherTableViewController : UITableViewController

@property (nonatomic) WeatherType weatherType;

@end
