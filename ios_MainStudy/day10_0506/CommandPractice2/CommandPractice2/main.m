//
//  main.m
//  CommandPractice2
//
//  Created by Sangwook's Macbook on 2016. 6. 7..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import <Foundation/Foundation.h>


// 스왑
void swap(int num1, int num2) {
    printf("변경 전 num1 : %d, num2 : %d\n", num1, num2);
    int temp = num1;
    num1 = num2;
    num2 = temp;
    printf("변경 후 num1 : %d, num2 : %d\n", num1, num2);
}

// 삼각수 구하기
int triangularNum(int num) {
    
    if (num <= 0) return 0;
    
    int result = 0;
    for (int i = 1; i <= num; ++i) {
        result += i;
    }
    return result;
}

// 삼각수 구하기2 (두 수 사이의 5의 배수에 행동하는 숫자의 삼각수)
void triangularsRangeNum(int num1, int num2) {
    int result = 0;
    // num1 부터 num2 까지
    for (int i = num1; i <= num2; ++i ) {
        // 5의 배수인 경우
        if (i%5 == 0) {
            result = triangularNum(i);
            printf("5의 배수 삼각수 : %d\n", result);
        }
    }
}

// 각 자리수 더하는 함수
void addAllNum(int num) {
    int result = 0;
    for (int i = num; i > 0; i/=10){
        result += (i%10);
    }
    printf("%d의 더한 수 : %d\n", num, result);
}




