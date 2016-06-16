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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeTextNoti:) name:@"ChangeTextNoti" object:nil];
}

-(void)changeTextNoti:(NSNotification *)noti
{
    NSString *text = noti.object;
    [self.lb setText:text];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
