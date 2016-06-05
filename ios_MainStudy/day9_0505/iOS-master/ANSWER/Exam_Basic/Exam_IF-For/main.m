//
//  main.m
//  Exam_IF-For
//
//  Created by youngmin joo on 2016. 5. 5..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

/*********************
         기본 함수 문제
           ***********************/

//1.산술함수 4가지 모두 만들기 - 더하기,빼기,곱하기, 나누기(소수점 3자리)

int add(int num1, int num2)
{//더하기
    return num1 + num2;
}
int min(int num1, int num2)
{//빼기
    return num1 - num2;
}
int mul(int num1, int num2)
{//곱하기
    return num1 * num2;
}
float divi(int num1, int num2)
{//나누기
    return (float)num1 / num2;
}

//2.평수 구하기(제곱미터를 받아서 평으로 변환 해주는 함수)
float roomSizeOfM2(int m2)
{
    return m2 * 0.3025;
}

//원주율
const float PI = 3.141592;
//3.원의 둘레구하기 (둘레 = 반지름 * 2π)
float circumference(int radius)
{
    return 2*radius*PI;
}

//4.달러 환전계산기
//오늘의 환율
const float exchangeRate = 1155;
int dollarOfKRW(int money)
{
    return  money/exchangeRate;
}

void check369number(int num);


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        printf("우리집 평수는 %0.2f입니다.",roomSizeOfM2(100));
//        int radius = 3959;
//        printf("지구의 반지름은 %d마일이며 둘레는 %0.2f입니다.",radius,circumference(radius));
//        int money = 1000000;
//        printf("%d원은 %d달러 입니다.",money, dollarOfKRW(money));
        check369number(1000);
        
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

/*********************
           for문
      ***********************/

//369게임

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

//무제한
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



//1. 삼각수 구하기.triangularNum
int triangularNum(int num)
{
    int totalNum = 0;
    for (int i = 1; i<=num; i++)
    {
        totalNum += i;
    }
    return totalNum;
}
//2,삼각수 구하기2 : 두 수사이의 5의 배수에 해당하는 숫자의 삼각수를 출력하시요. triangularsRangeNum

void multiplesTriangularNum(int startNum, int endNum)
{
    //swap
    if (startNum > endNum)
    {
        int temp = startNum;
        startNum = endNum;
        endNum = temp;
    }
    
    for (int i = startNum; i<= endNum; i++)
    {
       if (i%5==0)
       {
           printf("5의 배수는 %d이고, 삼각수는 %d입니다.",i,triangularNum(i));
       }
    }
}

//3.각 자리수 더하는 함수 addAllNum
void addAllDigit(int num)
{
    int compareNum = num;
    int totalNum = 0;
    while (compareNum>0) {
        int digit = compareNum%10;
        totalNum += digit;
        compareNum = compareNum/10;
    }
}



