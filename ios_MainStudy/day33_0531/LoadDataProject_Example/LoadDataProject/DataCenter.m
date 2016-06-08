//
//  DataCenter.m
//  LoadDataProject
//
//  Created by Sangwook's Macbook on 2016. 6. 2..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter

+(instancetype)sharedInstance
{
    static DataCenter *datacenter = nil;
    
    static dispatch_once_t *onceToken;
    dispatch_once(onceToken, ^{
        datacenter = [[DataCenter alloc]init];
    });
    return datacenter;
}

- (NSArray *)friendList
{
    NSArray *directoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//1
    NSString *documentsDirectory = [paths objectAtIndex:0]; //2
    NSArray *path = [documentsDirectory stringByAppendingPathComponent:@"friendList.plist"]; //3
    
    //파일 유무 확인
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:path]){
        //번들에 있는 걸 path
        NSString *bundlePath = [[NSBundle mainBundle]pathForResource:@"friendList" ofType:@"plist"];
        [fileManager copyItemAtPath:bundlePath toPath:path error:nil];
    }
    
//    NSString *path = [[NSBundle mainBundle]pathForResource:@"FriendList" ofType:@"plist"];
    NSArray *friendList = [NSArray arrayWithContentsOfFile:path];
    return friendList;
}

-(void)addFriendInfo:(NSString *)name phone:(NSString *)phone
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //1
    NSString *documentsDirectory = [paths objectAtIndex:0]; //2
    NSArray *path = [documentsDirectory stringByAppendingPathComponent:@"friendList.plist"]; //3
    
    //파일 유무 확인
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:path]){
        //번들에 있는 걸 path
        NSString *bundlePath = [[NSBundle mainBundle]pathForResource:@"friendList" ofType:@"plist"];
        [fileManager copyItemAtPath:bundlePath toPath:path error:nil];
    }

    NSMutableArray *friendList = [NSMutableArray arrayWithContentsOfFile:path];
    //딕셔너리 만들기
    NSDictionary *newFriend = @{@"name":name, @"phone":phone};
    //추가
    [friendList addObject:newFriend];
    
    //다시 파일로 변환
    [friendList writeToFile:path atomically:NO];
}


@end
