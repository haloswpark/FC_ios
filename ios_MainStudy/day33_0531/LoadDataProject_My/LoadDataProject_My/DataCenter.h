//
//  DataCenter.h
//  project
//
//  Created by Sangwook's Macbook on 2016. 6. 2..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

//싱글톤 변수의 클래스 메소드
+(instancetype)sharedInstance;

@property(nonatomic, strong) NSString *name;
@property(nonatomic, assign) NSInteger age;

-(void)printData;
@end
