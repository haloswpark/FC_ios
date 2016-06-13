//
//  ViewController.m
//  UITextfieldPractice
//
//  Created by Sangwook's Macbook on 2016. 6. 13..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//델리게이트 선언
<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *typeTF;
@property (weak, nonatomic) IBOutlet UIButton *enterBtn;

@end

@implementation ViewController

/***********1단계*************/
//1.델리게이트 선언
//2.델리게이트 호출
//3.텍스트 필드와 라벨값을 동일하게 해주기
- (IBAction)enterBtn:(UIButton *)sender {
    
    self.TFlabel.text = self.typeTF.text;
    //self.typeTF.text = @"";

}

- (void)viewDidLoad {
    [super viewDidLoad];
    //델리게이트 호출
    self.typeTF.delegate = self;
}

/***********2단계*************/
//텍스트 필드 완료(return key)누르고 난 후 키보드가 내려가도록 하기
//메소드 호출 => 한번 밖에 호출할 수 밖에 없기 때문에 텍스트필드가 많을 경우 if문이나 switch문으로 변경하여 정의해줄 것.

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //라벨과 텍스트 필드를 동일하게 하고 싶을 때
    self.TFlabel.text = self.typeTF.text;
    self.typeTF.text = @"";
    [textField endEditing:YES];
    //키보드를 내릴 때, 이 함수를 사용해도 상관없음[textField resignFirstResponder];
    //키보드를 올려줄 때, 이 함수를 사용[textField becomeFirstResponder];
    

    return YES;
}

/***********3단계*************/
//텍스트 필드를 입력하고 난 뒤 깔끔하게 사라지게 하기
//1.어디다 작성할지 어느 타이밍에 작성해야할지
//2.비어있는 텍스트필드를 어떻게 표현해야할지.
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    NSLog(@"textFieldShouldClear");
    [textField endEditing:YES];
    return YES;
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
