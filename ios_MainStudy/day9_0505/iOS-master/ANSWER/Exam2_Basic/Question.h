//
//  Question.h
//  CommandToolTest
//
//  Created by youngmin joo on 2016. 5. 12..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

+ (CGFloat)roundsNumStr:(NSString *)num;
+ (CGFloat)roundsNum:(CGFloat)num decimalPoint:(NSInteger)point;
+ (void)printDateWithYear:(NSInteger)year afterDay:(NSInteger)day;
+ (NSInteger)reversNum:(NSInteger)num;
@end
