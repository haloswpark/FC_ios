//
//  DataCenter.m
//  TableViewPractice
//
//  Created by Sangwook's Macbook on 2016. 6. 16..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "DataCenter.h"

@interface DataCenter()

@property (nonatomic, strong) NSMutableArray *worldWeather;
@property (nonatomic, strong) NSMutableArray *koreaWeather;

@end


//구현부
@implementation DataCenter
+ (instancetype) sharedInstance{
    static DataCenter *dataCenter = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[DataCenter alloc] init];
        dataCenter.worldWeather = [[NSMutableArray alloc] initWithObjects:@[@{@"뉴욕":@"30도 맑음"},@{@"서울":@"27도 흐림"},@{@"도쿄":@"25도 구름많음"},@{@"맬버른":@"20도 안개낌"},@{@"타이페이":@"45도 더움"}],nil];
        dataCenter.koreaWeather = [[NSMutableArray alloc] initWithObjects:@[@{@"서울":@"30도 맑음"},@{@"대전":@"27도 흐림"},@{@"대구":@"38도 더움"},@{@"부산":@"32도 맑음"},@{@"제주":@"24도 바람많음"}],nil];
    });
    return dataCenter;
}


//섹션을 입력받아, 데이터를 출력
- (NSMutableArray *)dataForSection:(NSInteger)section{
    if (section == 0){
        return self.worldWeather;
    }
    return self.koreaWeather;
}


//데이터 삭제
- (void)removeFirstSectionItemAtIndex:(NSInteger)index {
    [self.worldWeather removeObjectAtIndex:index];
}

@end
