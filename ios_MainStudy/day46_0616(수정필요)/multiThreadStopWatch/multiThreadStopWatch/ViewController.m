//
//  ViewController.m
//  multiThreadStopWatch
//
//  Created by Sangwook's Macbook on 2016. 6. 16..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lb;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (strong, nonatomic)NSThread *thread;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [NSThread detachNewThreadSelector:@selector(testThread:) toTarget:self withObject:nil];
    self.thread = [[NSThread alloc]initWithTarget:self selector:@selector(lb:) object:nil];
    [self.thread start];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)testThread:(NSThread *)thread
{
    NSInteger i = 0;
    while (self.startBtn.isEnabled == YES) {

    [self performSelectorOnMainThread:@selector(thread:) withObject:[NSNumber numberWithInteger:i] waitUntilDone:YES];
    }
}

-(void):(NSNumber *)number
{
    [self.lb setText:[NSString stringWithFormat:@"%@",number]];
}

@end
