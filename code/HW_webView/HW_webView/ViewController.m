//
//  ViewController.m
//  HW_webView
//
//  Created by Sangwook's Macbook on 2016. 5. 27..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UIWebViewDelegate, UITextFieldDelegate>
@property (nonatomic, strong) NSURL *myNSURL;
@property (nonatomic, strong) NSURLRequest *myNSURLRequest;
@property (nonatomic, strong) UITextField *textfield;
@property (nonatomic, strong) UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *topViewLayer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,90)];
    [topViewLayer setBackgroundColor: [UIColor lightGrayColor]];
    [self.view addSubview:topViewLayer];
    
    UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(0, 30, self.view.frame.size.width-80, 35)];
    [textfield setBackgroundColor: [UIColor grayColor]];
    [textfield setTextColor:[UIColor blueColor]];
    [textfield setPlaceholder: @"    웹 URL을 입력해주세요"];
    textfield.layer.cornerRadius = textfield.frame.size.height/2;
    textfield.delegate = self;
    [self.view addSubview:textfield];
    
    UIButton *goButton = [[UIButton alloc]initWithFrame:CGRectMake(textfield.frame.size.width+10, 30, 65, 35)];
    [goButton setBackgroundColor:[UIColor whiteColor]];
    [goButton setTitle:@"go" forState:UIControlStateNormal];
    [goButton setTitleColor:[UIColor grayColor]forState:UIControlStateNormal];
    [goButton setTitleColor:[UIColor blueColor]forState:UIControlStateHighlighted];
 
    goButton.layer.cornerRadius = textfield.frame.size.height/2;
    [self.view addSubview:goButton];
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 90, self.view.frame.size.width, self.view.frame.size.height+90)];
    [self.view addSubview: webView];
    
    UIView *bottomViewLayer = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width, 50)];
    [bottomViewLayer setBackgroundColor:[UIColor lightGrayColor]];
    
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    [backBtn setImage:[UIImage imageNamed:@"backBtn"] forState:UIControlStateDisabled];
//    [backBtn setTitle: @"↖(^^↖)" forState:UIControlStateNormal];
//    [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlState;
    [backBtn setEnabled:NO];
    [bottomViewLayer addSubview:backBtn];
    [self.view addSubview:bottomViewLayer];
    
    UIButton *frontBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 40)];
    [frontBtn setImage:[UIImage imageNamed:@"frontBtn"] forState:UIControlStateDisabled];
//    [frontBtn setTitle: @"(↗^^)↗" forState:UIControlStateNormal];
//    [frontBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [frontBtn setEnabled:NO];
    [bottomViewLayer addSubview:frontBtn];
    [self.view addSubview:bottomViewLayer];
    
    webView.delegate = self;
    NSURL *url = [[NSURL alloc]init];
    self.myNSURL = url;
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    self.myNSURLRequest = request;
    [webView setScalesPageToFit:YES];
   }



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//웹 Url 형성해주는 문장
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSURL *nsURL = [[NSURL alloc]initWithString:textField.text];
    NSURLRequest *nsURLRequest = [[NSURLRequest alloc]initWithURL: nsURL];
    [self.webView loadRequest:nsURLRequest];
    [textField resignFirstResponder];
    return YES;


}

@end
