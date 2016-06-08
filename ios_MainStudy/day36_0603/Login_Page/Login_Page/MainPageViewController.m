//
//  ViewController.m
//  Login_AutoLayout
//
//  Created by Sangwook's Macbook on 2016. 6. 2..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "MainPageViewController.h"

@interface MainPageViewController ()<UINavigationBarDelegate>

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)loginOutBtn:(UIButton *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}




@end