//
//  DataCenter.m
//  example0609
//
//  Created by Mookie on 2016. 6. 9..
//  Copyright © 2016년 Mookie. All rights reserved.
//

#import "DataCenter.h"

@interface DataCenter()

@property (nonatomic, strong) NSMutableArray *firstSectionData;
@property (nonatomic, strong) NSMutableArray *secondSectionData;

@end


//구현부
@implementation DataCenter
+ (instancetype) sharedInstance{
    static DataCenter *dataCenter = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[DataCenter alloc] init];
        dataCenter.firstSectionData = [[NSMutableArray alloc] initWithObjects:@"A",@"B",@"C",nil];
        dataCenter.secondSectionData = [[NSMutableArray alloc] initWithObjects:@"A",@"B",@"C",nil];
    });
    return dataCenter;
}


//섹션을 입력받아, 데이터를 출력
- (NSMutableArray *)dataForSection:(NSInteger)section{
    if (section == 0){
        return self.firstSectionData;
    }
    return self.secondSectionData;
}

//데이터 추가
- (void)insertNewItemInSecondSection{
    [self.secondSectionData addObject:@"New Item"];
}

//데이터 삭제
- (void)removeFirstSectionItemAtIndex:(NSInteger)index {
    [self.firstSectionData removeObjectAtIndex:index];
}



@end
