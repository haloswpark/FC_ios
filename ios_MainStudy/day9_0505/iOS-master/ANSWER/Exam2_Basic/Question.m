//
//  Question.m
//  CommandToolTest
//
//  Created by youngmin joo on 2016. 5. 12..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

/*
 마지막 수에서 반올림 하기
 [question roundsNum:3.1234] >>> return :  3.123
 [question roundsNum:3.35] >>> return :  3.4
 년도와 일수 입력받아 Date출력
 [question inputYear:2016 afterDay:102]
 2016년의 102일 번째 날은 4월 11일 입니다.
 리버스 함수
 [question reversNum:2016] >>> return :  6102
 [question reversNum:14829] >>> return : 92841
 */

#import "Question.h"

@implementation Question





+ (CGFloat)roundsNumStr:(NSString *)num
{
    
    NSArray *sperStr = [num componentsSeparatedByString:@"."];
    NSString *decimalPointStr = sperStr[1];
    NSUInteger  decimalPoint = decimalPointStr.length;
    
    
    return [Question roundsNum:num.doubleValue decimalPoint:decimalPoint];;
}


+ (CGFloat)roundsNum:(CGFloat)num decimalPoint:(NSInteger)point
{
    
    NSInteger pointToIntValue = [Question squarNum:10 exponential:point-1];
    
    num = (num * pointToIntValue) + 0.5;
    NSInteger changeIntNum = num;
    CGFloat roundNum = (CGFloat)changeIntNum/pointToIntValue;
    
    return roundNum;
}

//년도와 일수 입력받아 Date출력
+ (void)printDateWithYear:(NSInteger)year afterDay:(NSInteger)day
{
    
    NSInteger month = 0;
    NSInteger resultDay = 0;
    while (day > resultDay) {
        month++;
        resultDay += [Question lastDayOfMonth:month year:year];
        
    }
    
    resultDay = [Question lastDayOfMonth:month year:year] - (resultDay - day);
    NSLog(@"%ld년의 %ld일째 날은 %ld월 %ld일 입니다.",(long)year,day,(long)month, (long)resultDay);
}

+ (NSInteger)reversNumVerStr:(NSInteger)num
{
    NSString *tempStr = @"";
    
    while (num>0) {
        NSInteger lastNum = num%10;
        tempStr = [tempStr stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)lastNum]];
        num = num/10;
    }
    
    return tempStr.integerValue;
}


+ (NSInteger)reversNum:(NSInteger)num
{
    NSInteger length = 0;
    NSMutableArray *numList = [[NSMutableArray alloc] initWithCapacity:1];
    
    //숫자 길이 구하기
    while (num>0) {
        [numList addObject:[NSNumber numberWithInteger:num%10]];
        length++;
        num = num/10;
        
    }
    //length == 4
    NSInteger total = 0;
    for (NSNumber *n in numList)
    {
        length--;
        total += (n.integerValue*[Question squarNum:10 exponential:length]);
        
    }
    
    
    return total;
}

+ (NSInteger)squarNum:(NSInteger)num exponential:(NSInteger)ex
{
    NSInteger squarNum = 1;
    
    if (ex > 0) {
        for (int i = 0; i<ex; i++) {
            squarNum = squarNum*num;
        }
        return  squarNum;
    }else
    {
        return 1;
    }
    
}


//각 월의 마지막 날 가져오기
+ (NSInteger)lastDayOfMonth:(NSInteger)month year:(NSInteger)year
{
    switch (month) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            return 31;
            break;
        case 4:
        case 6:
        case 9:
        case 11:
            return 30;
            break;
        case 2:
            //윤년 계산후 결과 값
            if ([Question isLeapYear:year]) {
                return 29;
            }else
            {
                return 28;
            }
            break;
        default:
            return 0;
            break;
    }
}

//년도에 따라 윤년 계산
+ (BOOL)isLeapYear:(NSInteger)year
{
    if (year%400==0 || (year%100!=0 && year%4==0)) {
        return YES;
    }else
    {
        return NO;
    }
}



@end
