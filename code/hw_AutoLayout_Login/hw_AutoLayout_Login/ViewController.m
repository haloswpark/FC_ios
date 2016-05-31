//
//  ViewController.m
//  hw_AutoLayout_Login
//
//  Created by Sangwook's Macbook on 2016. 5. 22..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//로그인 ID입력 화면 프라퍼티 선언
@property(nonatomic, weak)IBOutlet UITextField *ID_tf;
//로그인 비밀번호 입력 화면 프라퍼티 선언
@property(nonatomic, weak)IBOutlet UITextField *PW_tf;

//로그인 버튼 선언
-(IBAction)loginAction:(UIButton *)login_btn;
//로그인 비밀번호 선언
-(IBAction)registerAction:(UIButton *)register_btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)loginAction:(UIButton *)login_btn
{
    
}

-(IBAction)registerAction:(UIButton *)register_btn
{
    
}

@end
