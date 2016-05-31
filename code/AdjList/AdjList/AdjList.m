//
//  AdjList.m
//  AdjList
//
//  Created by Sangwook's Macbook on 2016. 5. 30..
//  Copyright © 2016년 swpark. All rights reserved.
//

//arr[i] = i와 연결되어있는 모든 정점이 저장되어 있어야함
//1차원 array의 1차원 array


//arr이 생긴 모양 : [[], [], [], [], []]
//1->2 간선이 추가
//arr이 생긴 모양: [[], [], [], [], []]
//2->3 간선이 추가 :
//arr이 생긴 모양: [[], [], [], [], []]
//4->5 간선이 추가 :
//arr이 생긴 모양: [[], [], [], [], []]

#import "AdjList.h"

@interface AdjList ()

@property (readwrite) NSInteger vertex;
@property (strong)NSMutableArray *arr;

@end

@implementation AdjList

-(instancetype)initWithVertex:(NSInteger)vertex {
    self=[super init];
    if(self) {
        //init
        self.vertex=vertex;
    }
    return self;
}

@end
