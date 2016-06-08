//
//  main.m
//  D-day
//
//  Created by Sangwook's Macbook on 2016. 6. 7..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>

// 스왑
void swap(int num1, int num2);
// 삼각수 구하기
int triangularNum(int num);
// 삼각수 구하기 2
void triangularsRangeNum(int num1, int num2);
// 각 자리수 더하는 함수
void addAllNum(int num);

/***************************************************************
 D - Day 구하는 프로그램
 1. 이벤트 날짜가 지났는지 체크
 2. 년도 차이 구하기
 3. Day 구하기
 int diffYDay = (yearDif - beforDay + afterDay);
 4. D+, D- 선택
 ***************************************************************/

int eventDate;
// 윤년인지 확인 하는 함수
bool isLeapYear(int year);
// 각 달의 마지막 날이 몇일인지 확인 하는 함수
int lastDayOfMonth(int month, int year);
// day구하기
int totalDayWithDate(int date);
// D-Day구하기
void calculationDday(int today);
// 이벤트 날짜 설정
void setEventDate(int date);


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //        swap(10, 11);
        //        printf("삼각수 : %d\n", triangularNum(10));
        //        triangularsRangeNum(1,25);
        //        addAllNum(5792);
        //        setAnniversary(20161010);
        //        checkDDay(20160506);
        
        // ex) yyyyMMdd
        setEventDate(20160516);
        calculationDday(20150514);
        
    }
    return 0;
}

// 이벤트 날짜 설정
void setEventDate(int date) {
    eventDate = date;
}

// day 구하기
int totalDayWithDate(int date) {
    int totalDay = 0;
    int year = date/1000;
    int month = (date%10000)/100;
    
    for (int i = 1; i < month; ++i ) {
        totalDay += lastDayOfMonth(i, year);
    }
    return totalDay;
}

// D-Day구하기
void calculationDday(int today) {
    
    int Dday=0;
    
    int beforeDate;
    int afterDate;
    
    // 이벤트 날짜가 지났는지 체크
    if (eventDate > today) {
        afterDate=eventDate;
        beforeDate=today;
    }
    else {
        afterDate=today;
        beforeDate=eventDate;
    }
    
    
    //Dday와 Today의 선후 관계에 따라 +인지 -인지 출력
    if(eventDate <= today)
        printf("D +%d일\n", Dday);
    else
        printf("D -%d일\n", Dday);
}


// 각 달의 마지막 날이 몇일인지 확인 하는 함수
int lastDayOfMonth(int month, int year) {
    switch (month) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            return 31;
        case 2:
            if (isLeapYear(year)) return 29;
            else return 28;
        case 4:
        case 6:
        case 9:
        case 11:
            return 30;
        default:
            return 0;
            break;
    }
}


/********************************************************/


