//
//  DataCenter.h
//  example0609
//
//  Created by Mookie on 2016. 6. 9..
//  Copyright © 2016년 Mookie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataCenter : NSObject
//싱글톤 객체 생성
+ (instancetype) sharedInstance;

//해당 섹션의 데이터 리턴
- (NSMutableArray *)dataForSection:(NSInteger)section;

//세컨드 섹션에 데이터 추가
- (void)insertNewItemInSecondSection;

//첫번째 섹션에 데이터 삭제
- (void)removeFirstSectionItemAtIndex:(NSInteger)index;
@end
