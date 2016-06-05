//
//  if_moon.m
//  IfForPractice
//
//  Created by Sangwook's Macbook on 2016. 6. 5..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}


/*********************
 if문
 ***********************/

//1.절대값 구하기
int absoluteNum(int num)
{
    if (num < 0)
    {
        num = num*(-1);
    }
    return num;
}

//2.문자 구분 : 문자 하나를 입력받아 이 문자가 소문자인지, 대문자인지, 숫자 인지 구분
void checkAlpha(char word)
{
    if(word >= 'a' && word <= 'z')
    {
        printf("%c는 소문자입니다",word);
    }else if(word >= 'A' && word <= 'Z')
    {
        printf("%c는 대문자입니다",word);
    }else if(word >= '0' && word <= '9')
    {
        printf("%c는 숫자입니다",word);
    }
}

//3.윤년 구하기
bool isLeapYear(int year)
{
    if (year%400==0 || (year%100!=0 && year%4==0))
    {
        return true;
    }else
    {
        return false;
    }
}

