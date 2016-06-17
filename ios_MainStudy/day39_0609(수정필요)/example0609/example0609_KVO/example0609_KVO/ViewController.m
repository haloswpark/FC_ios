//
//  ViewController.m
//  example0609_KVO
//
//  Created by Mookie on 2016. 6. 9..
//  Copyright © 2016년 Mookie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) NSInteger count;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setCount:5];
    NSLog(@"count : %zd",_count);
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setCount:(NSInteger)count{
    _count = count;
}
@end
