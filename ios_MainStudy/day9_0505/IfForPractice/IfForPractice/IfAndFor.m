//
//  IfAndFor.m
//  IfForPractice
//
//  Created by Sangwook's Macbook on 2016. 6. 7..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import <Foundation/Foundation.h>

/********************* if문 ***********************/

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
void checkAlphabet(char word)
{
    if(word >= 'a' && word <= 'z')
    {
        printf("%c는 소문자입니다\n",word);
    }else if(word >= 'A' && word <= 'Z')
    {
        printf("%c는 대문자입니다\n",word);
    }else if(word >= '0' && word <= '9')
    {
        printf("%c는 숫자입니다\n",word);
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

/********************* for문 ***********************/

//1. for문으로 구구단 구하기
void getMutiplicationTable(int dan) {
    for (int i = 1;i < 10; ++i) {
        printf("%d * %d = %d\n", dan, i, dan * i);
    }
}

//2. 팩토리얼
void factorial(int n) {
    int result = 1;
    for (int i = 1; i <= n;++i) {
        result *= i;
    }
    printf("factorial : %d\n", result);
}


//3.369게임

const int limit = 29;
void check369numberLimit(int num)
{
    if (num <= limit) {
        for(int i=1; i<=num; i++)
        {
            int lastNum = i%10;
            if (lastNum!=0 && lastNum%3==0)
            {
                printf("*, ");
            }else
            {
                printf("%d, ",i);
            }
        }
    }else
    {
        printf("입력 숫자가 제한 숫자보다 큰 숫자입니다.");
    }
    
}

//4. 369게임 무제한의 경우
void check369number(int num)
{
    //전체 숫자를 검사
    for(int i = 1; i<=num; i++)
    {
        //현재 검사할 숫자
        int bufferNum = i;
        
        //isStart가 true이면 3,6,9박수
        bool isStar = false;
        //검사
        /*
         bufferNum의 숫자를 확인해서 3,6,9가 들어 있는지 확인 하는 구분
         */
        while (bufferNum > 0) {
            //1의 자리 숫자검사
            int lastNum = bufferNum%10;
            if (lastNum!=0 && lastNum%3==0)
            {
                isStar = true;
                break;
            }
            //1의 자리 숫자 제거
            bufferNum = bufferNum/10;
        }
        
        if (isStar)
        {
            printf("*, ");
        }else
        {
            printf("%d, ",i);
        }
    }
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        checkAlphabet('C');
        int year = 2016;
        if (isLeapYear(year)) {
            printf("%d년은 윤년입니다.\n", year);
        } else {
            printf("%d년은 윤년이 아닙니다.\n", year);
        }
        getMutiplicationTable(98);
        factorial(25);
        check369numberLimit(10);
        check369number(100);
    }
    return 0;
}

