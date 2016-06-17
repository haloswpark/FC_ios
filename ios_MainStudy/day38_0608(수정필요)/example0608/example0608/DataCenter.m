//
//  DataCenter.m
//  example0608
//
//  Created by Mookie on 2016. 6. 8..
//  Copyright © 2016년 Mookie. All rights reserved.
//
#import "DataCenter.h"

static NSString *const keySoundSetting = @"UserSoundIsOn";
static NSString *const KeyVibrateSetting = @"UserVibrateIsOn";

@interface DataCenter()

@property (nonatomic, strong) NSArray *settingTableData;
@property (nonatomic, strong) NSArray *weatherData;
@property (nonatomic, strong) NSArray *settingHeaderTitle;

@end

@implementation DataCenter


+ (instancetype)defaultData{
    static DataCenter *dataCenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[DataCenter alloc] init];
        dataCenter.settingTableData = @[@[@"사운드", @"진동"], @[@"세계날씨", @"한국날씨"]];
        dataCenter.settingHeaderTitle = @[@"설정", @"날씨"];
    });
    
    return dataCenter;
}

-(NSInteger)numberOfSectionsForSettingTable{
    return [[self settingHeaderTitle] count];
}

-(NSArray *)settingTableDataForSection:(NSInteger)section {
    return (NSArray *)self.settingTableData[section];
}

-(NSInteger)numberOfRowsForSectionInSettingTable:(NSInteger)section{
    return [[self settingTableDataForSection:section] count];
}

-(NSString*)settingTableHeaderTitleForSection:(NSInteger)section{
    return (NSString *)self.settingHeaderTitle[section];
}

//Setting 값 저장
-(void)setSetting:(SettingRow)function isOn:(BOOL)isOn{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *key = nil;
    if (function == SettingRowSound){
        key = keySoundSetting;
    }else{
        key = KeyVibrateSetting;
    }
    
    [userDefault setBool:isOn forKey:key];
    [userDefault synchronize];
}


-(BOOL)isOnForSetting:(SettingRow)function{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *key = nil;
    if (function == SettingRowSound){
        key = keySoundSetting;
    }else{
        key = KeyVibrateSetting;
    }
    
    return [userDefault boolForKey:key];
}

-(NSArray *)dataforWeather:(WeatherType)type{
    if (type == WeatherTypeKorea){
        return @[@"서울",@"대전",@"인천",@"부산"];
    }else{
        return @[@"Seoul", @"Paris", @"New York", @"Berlin", @"GuangZhou"];
    }
}

@end
