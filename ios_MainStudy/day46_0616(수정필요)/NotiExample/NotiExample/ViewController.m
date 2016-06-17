//
//  ViewController.m
//  NotiExample
//
//  Created by Sangwook's Macbook on 2016. 6. 16..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lb;
@property (nonatomic, strong) NSThread *thread;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeTextNoti:) name:@"ChangeTextNoti" object:nil];
   
    //[NSThread detachNewThreadSelector:@selector(testThread:) toTarget:self withObject:nil];
//    self.thread = [[NSThread alloc]initWithTarget:self selector:@selector(testThread:) object:nil];
//    [self.thread start];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(upKeyboard:) name:UIKeyboardDidShowNotification object: nil];
}
//
//-(void)testThread:(NSThread *)thread
//{
//    NSInteger i = 0;
//    while (self.thread.isCancelled == NO) {
//        
//        
//        [self performSelectorOnMainThread:@selector(changeDisplay:) withObject:[NSNumber numberWithInteger:i] waitUntilDone:YES];
//    [self.lb setText:[NSString stringWithFormat:@"%ld",i++]];
//    }
//}
//
//-(void)changeDisplay:(NSNumber *)number
//{
//    [self.lb setText:[NSString stringWithFormat:@"%@",number]];
//}

-(void)changeTextNoti:(NSNotification *)noti
{
    NSString *text = noti.object;
    [self.lb setText:text];
}


-(void)upKeyboard:(NSNotification *)noti
{
    NSLog(@"show keyboard");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
