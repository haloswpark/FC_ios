//
//  DataCenter.h
//  example0608
//
//  Created by Mookie on 2016. 6. 8..
//  Copyright © 2016년 Mookie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherTableViewController.h"

typedef NS_ENUM(NSInteger, SettingRow) {
    SettingRowSound = 0,
    SettingVibrate
};

@interface DataCenter : NSObject
+ (instancetype)defaultData;
-(NSInteger)numberOfSectionsForSettingTable;
-(NSArray *)settingTableDataForSection:(NSInteger)section;
-(NSInteger)numberOfRowsForSectionInSettingTable:(NSInteger)section;
-(NSString*)settingTableHeaderTitleForSection:(NSInteger)section;
-(void)setSetting:(SettingRow)function isOn:(BOOL)isOn;
-(BOOL)isOnForSetting:(SettingRow)function;
-(NSArray *)dataforWeather:(WeatherType)type;
@end
