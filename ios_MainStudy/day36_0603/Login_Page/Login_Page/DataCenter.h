//
//  DataCenter.h
//  Login_AutoLayout
//
//  Created by Sangwook's Macbook on 2016. 6. 7..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

+ (instancetype)sharedInstance;

-(NSMutableDictionary *)callUserInformation;
-(NSMutableDictionary *)findByUserId:(NSString *)userID;
-(void)addUserInformation:(NSString *)userID userPW:(NSString *)userPW;

@end

