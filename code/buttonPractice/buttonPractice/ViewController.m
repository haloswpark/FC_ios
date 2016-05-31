//
//  ViewController.m
//  buttonPractice
//
//  Created by Sangwook's Macbook on 2016. 5. 26..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) UILabel* myLabel;
@property (nonatomic, weak) UITextField* tf;

@end

@implementation ViewController



//다 지워보고 다시 만드셈.

- (void)viewDidLoad {
    [super viewDidLoad];
//
////    UIImageView *imgView = [[UIImageView alloc]initWithFrame: CGRectMake(0, 0, 100,35)];
////    [imgView setImage:[UIImage imageNamed:@"l_login_btn1"]];
////    [imgView setImage:[UIImage imageNamed:@"l_login_btn2"]];
//
//
//    //UIImageView *imgView2 = [[UIImageView alloc]initWithFrame: CGRectMake(30, 150, 100,35)];
//    //[imgView setImage:[UIImage imageNamed:@"l_login_btn2"]];
//    //[self.view addSubview:imgView2];
//    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.tag=1;
//    [btn setFrame:CGRectMake(30, 150, 100, 35)];
//    [btn addTarget:self action:@selector(onTouchUpInsideBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [btn setTitle:@"1번" forState:UIControlStateNormal];
////    [btn setBackgroundImage: imgView  forState:UIControlStateNormal];
////    //[btn setBackgroundImage: imgView2 forState:UIControlStateSelected];
//    [btn setTitleColor:[UIColor darkGrayColor]forState: UIControlStateNormal];
//    [btn setTitleColor:[UIColor greenColor]forState: UIControlStateSelected];
//    [self.view addSubview:btn];
//
//    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn1.tag=2;
//    [btn1 setFrame:CGRectMake(120, 150, 100, 35)];
//    [btn1 addTarget:self action:@selector(onTouchUpInsideBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [btn1 setTitle:@"2번" forState:UIControlStateNormal];
//    [btn1 setTitleColor:[UIColor darkGrayColor]forState: UIControlStateNormal];
//    [btn1 setTitleColor:[UIColor blueColor]forState: UIControlStateHighlighted];
//    [self.view addSubview:btn1];
//    
//    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn2.tag=300;
//    [btn2 setFrame:CGRectMake(30, 300, 100, 35)];
//    [btn2 addTarget:self action:@selector(onTouchUpInsideBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [btn2 setTitle:@"3번" forState:UIControlStateNormal];
//    [btn2 setTitleColor:[UIColor darkGrayColor]forState: UIControlStateNormal];
//    [btn2 setTitleColor:[UIColor orangeColor]forState: UIControlStateHighlighted];
//    [self.view addSubview:btn2];
//    
//    UIButton *btn3= [UIButton buttonWithType:UIButtonTypeCustom];
//    btn3.tag=4;
//    [btn3 setFrame:CGRectMake(120, 300, 100, 35)];
//    [btn3 addTarget:self action:@selector(onTouchUpInsideBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [btn3 setTitle:@"4번" forState:UIControlStateNormal];
//    [btn3 setTitleColor:[UIColor darkGrayColor]forState: UIControlStateNormal];
//    [btn3 setTitleColor:[UIColor redColor]forState: UIControlStateHighlighted];
//    [self.view addSubview:btn3];
//    
//    UILabel *myLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 150, 100, 35)];
//    [myLabel setTextColor:[UIColor orangeColor]];
//    [self.view addSubview:myLabel];


    
    
    
    
    UITextField *tf1 = [[UITextField alloc]initWithFrame:CGRectMake(30, 100, 100, 40)];
    tf1.placeholder = @"input Text";
    tf1.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:tf1];
    
    
    UITextField *tf2 = [[UITextField alloc]initWithFrame:CGRectMake(30, 150, 100, 40)];
    tf2.placeholder = @"input Text";
    tf2.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:tf2];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.tag=2;
    [btn1 setFrame:CGRectMake(120, 150, 100, 35)];
    [btn1 addTarget:self action:@selector(onTouchUpInsideBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setTitle:@"확인" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor darkGrayColor]forState: UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blueColor]forState: UIControlStateHighlighted];
    [self.view addSubview:btn1];

   
}

- (void)onTouchUpInsideBtn:(UIButton *)sender{
        if (sender. selected){
            sender. selected = NO;
        } else {
            sender. selected = YES;
        }

        NSLog(@"선택된 버튼은 : %ld번 버튼",(long)sender. tag);
        _myLabel.text = [NSString stringWithFormat:@"선택된 버튼은 : %ld번 버튼", (long)sender. tag];
    }


-(BOOL)textFieldSHouldReturn:(UITextField *)textfield
{
    NSUInteger tagNum = textfield.tag;
    
    if (tagNum == 1){
        [self.tf becomeFirstResponder];
    }else if (tagNum == 2)
    {
        //self.tf1 == textField
        //  [self.tf1] resignFirstResponder];
        [textfield resignFirstResponder];
    }else
    {
        NSLog(@"안불릴껄");
    }
    NSLog(@"call Return Delegare Method");
    //  [textfield resignFirstResponder];
    
    return NO;
}


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"Call textfieldShouldBeginEditing");
    
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"Call textfieldDidBeginEditing");
}


-(BOOL)textFieldShouldReturn: (UITextField *)textField
{
    NSLog(@"call Return Delegate Method");
    [textField resignFirstResponder];
    
    return NO;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
