//
//  main.m
//  CommandPractice
//
//  Created by Sangwook's Macbook on 2016. 6. 5..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import <Foundation/Foundation.h>

//기본 함수 문제

//2.평수 구하기 (제곱미터 입력 시 평 단위로 변환)
float roomSize0fM2(int m2)
{
    return m2 * 0.3025;
}


//3.원의 둘레 구하기(반지름 * 2π)

//원주율 값 지정
const float PI = 3.141592;
float circircumference(int radius)
{
    return 2*radius*PI;
}


//4. 환율 계산기 (원 ->달러)
//오늘의 환율
const float currencyRate = 1130;
int dollarOfKRW(int money)
{
    return money/currencyRate;
}

//5. 소수점 반올림해주기 (셋째자리 기준.)
//100을 곱해주고 0.5 더해준 후 다시 소숫점으로 돌리기 위해 100 나눠줌
float getThirdPoint(float num)
{
    return (float)((int)(num*100)+0.5)/100;
}

//6. 짝수 구분
bool isEvenNumber(int num) {
    if (num%2) {
        return false;}
    else{
        return true;
        }
    }

//7.성적 등급 환산
int scoreGrade(float avgScore) {
    int grade = 0;
    if (100 >= avgScore && avgScore >= 90){
        grade = 1;
    }else if (89 >= avgScore && avgScore >=80){
        grade = 2;
    }else if (79 >= avgScore && avgScore >=70){
        grade = 3;
    }else if (69 >= avgScore && avgScore >= 60){
        grade = 4;
    }else if (59 >= avgScore && avgScore >=50){
        grade = 5;
    }else if (49 >= avgScore && avgScore >=40){
        grade = 6;
    }else if (39 >= avgScore && avgScore >=30){
        grade = 7;
    }else if (29 >= avgScore && avgScore >=20){
        grade = 8;
    }else if (19 >= avgScore && avgScore >=10){
        grade = 9;
    }else if (9 >= avgScore && avgScore >=0){
        grade = 10;
    }
        return grade;
}

//8.성적에 따른 장학금 수혜자 선정
void scholarshipWithGrade(int grade) {
    switch (grade){
        case 1:
            printf("이 학생은 전액 장학금 수혜 대상자입니다!\n");
            //이 부분에 해당되면 식이 종료되고, 그렇지 않으면 그 다음 케이스로 이동
            break;
        case 2:
            printf("이 학생은 50%%장학금 수혜 대상자입니다!\n");
            break;
        case 3:
            printf("이 학생은 25%%장학금 수혜 대상자입니다!\n");
        default:
            printf("장학금 수혜자 대상이 아닙니다 공부를 좀 더 열심히 하세요.\n");
                }
}


//9. 절대값 구하기
int absoluteNum(int num) {
    if (num < 0) {
        num = -num;
    }
    return num;
}

//10. 문자 구분
void checkAlphabet(char ch) {
    if ('a' <= ch && ch <= 'z') {
        printf("%c는 소문자 입니다.\n", ch);
    }else if ('A' <= ch && ch <= 'Z') {
        printf("%c는 대문자 입니다.\n", ch);
    }else {
        printf("%c는 숫자 입니다.\n", ch);
    }
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
//         insert code here...
    printf("우리집 평수는 %0.2f입니다.\n",roomSize0fM2(100));
    int radius = 4590;
    printf("반지름은 %d이고 둘레는 %0.2f입니다.\n",radius,circircumference(radius));
    int money = 1250000;
    printf("%d원은 %d달러 입니다.\n",money, dollarOfKRW(money));
    float avgScore = 90;
    printf("%0.1f점의 등급은? %d등급입니다.\n", avgScore, scoreGrade(avgScore));
    scholarshipWithGrade(2);
    int num = 100;
    printf("%d의 절대값은 : %d입니다\n", num, absoluteNum(num));
    checkAlphabet('D');
        
    }
    return 0;
}