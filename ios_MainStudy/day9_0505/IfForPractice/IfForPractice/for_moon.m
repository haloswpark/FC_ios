//
//  for_moon.m
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

