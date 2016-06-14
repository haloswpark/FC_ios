//
//  DataCenter.h
//  TabbarControllerExample
//
//  Created by Sangwook's Macbook on 2016. 6. 14..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

+(instancetype)sharedInstance;
@property (nonatomic, weak)NSString *tempString;

@end
