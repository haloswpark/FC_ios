//
//  ViewController.m
//  myCacluator
//
//  Created by Sangwook's Macbook on 2016. 6. 1..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //초기 내용값 설정 initialize 해주기
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





//초기 함수
-(void) initData{
    resultNum=0;
    operatorBuffer=@"";
    displayText=@"";
    [self.displayTextField setText:
    [NSString stringWithFormat:@"%zd",resultNum]];
}

//덧셈 연산값
-(void)operationAdd: (NSInteger)secondNum;
{
    resultNum=resultNum+secondNum;
}

//뺄셈 연산값
-(void)operationSubtract: (NSInteger)secondNum;
{
    resultNum=resultNum-secondNum;
}

//곱셈 연산값
-(void)operationMultiply: (NSInteger)secondNum;
{
    resultNum=resultNum*secondNum;
}

//나눗셈 연산값
-(void)operationDivide: (NSInteger)secondNum;
{
    resultNum=resultNum/secondNum;
}

//SecondNum 돌아갈 때 사용
-(void)operatingWithSceondNum:(NSInteger)num;
{
    if(operatorBuffer.length !=0){
        if([operatorBuffer isEqualToString:@"+"]){
            [self operationAdd:num];
        }else if ([operatorBuffer isEqualToString:@"-"]){
            [self operationSubtract:num];
        }else if ([operatorBuffer isEqualToString:@"*"]){
            [self operationMultiply:num];
        }else if([operatorBuffer isEqualToString:@"/"]){
            [self operationDivide:num];
        }else{
            NSLog(@"error");
        }
    }else{
        resultNum=num;
    }
}

//액션 값 지정
-(IBAction)onTouchUpInsideNumberBtn:(id)sender{
    NSString *numberStr = ((UIButton *)sender).titleLabel.text;
    displayText = [displayText stringByAppendingString:numberStr];
    [self.displayTextField setText:displayText];
}

-(IBAction)onTouchUpInsideOperationBtn:(UIButton *)sender
{
    //처음에 숫자가 들어가야함
    if(displayText.length>0){
        //기존 display에 있는 숫자를 결과에 추가함.
        [self operatingWithSceondNum:displayText.integerValue];
        //result(결과값)을 텍스트로 변경해서 표시함
        [self.displayTextField setText:[NSString stringWithFormat:@"%zd", resultNum]];
        //디스플레이 텍스트 지워줌
        displayText=@"";
        //오퍼레이션을 버퍼에 넣어줌
        operatorBuffer=sender.titleLabel.text;
    }else{
        //연산기호 변경해줌
        if (operatorBuffer.length !=0){
            operatorBuffer = sender.titleLabel.text;
        }
    }
}

-(IBAction)onTouchUpInsideResultBtn:(id)sender
{
    if (displayText.length>0){
        [self operatingWithSceondNum:displayText.integerValue];
        [self.displayTextField setText:[NSString stringWithFormat:@"%zd", resultNum]];
        displayText=@"";
    }
}

-(IBAction)onTouchUpInsideCancelBtn:(id)sender{
    [self initData];
}

@end
