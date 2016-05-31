//
//  AdjList.h
//  AdjList
//
//  Created by Sangwook's Macbook on 2016. 5. 30..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdjList : NSObject

-(instancetype)initWithVertex : (NSInteger)vertex;
//from-> to 간선을 추가 (bidirection ==YES) 양방향
-(BOOL)addEdgeWithFrom:(NSInteger)from andTO:(NSInteger)to
       andBidirection : (BOOL)bidirection;
-(BOOL)addEdgeWithFrom:(NSInteger)from andTO:(NSInteger)to
       andBidirection : (BOOL)bidirection;

@end
