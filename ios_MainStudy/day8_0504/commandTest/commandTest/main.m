//
//  main.m
//  commandTest
//
//  Created by Sangwook's Macbook on 2016. 6. 1..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import <Foundation/Foundation.h>

//성적 선언
int KoreanScore=0;
int MathScore=0;
int EnglishScore=0;
int ScienceScore=0;

void setKoreanScore(int newScore){
    KoreanScore=newScore;
}

void setMathScore(int newScore){
    MathScore=newScore;
}

void setEnglishScore(int newScore){
    EnglishScore=0;
}

void setScienceScore(int newScore){
    ScienceScore=0;
}

//점수총합구하기
int totalScore(){
    return KoreanScore + MathScore + EnglishScore + ScienceScore;
}

//점수평균구하기 (*float값으로 지정해주는 것 유의할 것*)
float averageScore(){
    return (float) totalScore()/4;
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //시험 성적 입력부분
        setKoreanScore(95);
        setMathScore(70);
        setEnglishScore(100);
        setScienceScore(90);
        
        //시험성적 출력부분 (줄 나눠서 구해줄때)
//        printf("총점은 %d\n이고 평균은 %0.2f\n 입니다.", totalScore(), averageScore());
        
        //시험 성적 그냥 적어 내려갈때
        printf("총점은 %d\n이고 평균은 %0.2f\n 입니다.", totalScore(), averageScore());

    }
    return 0;
}
