//
//  ViewController.m
//  WhaleWebView
//
//  Created by Sangwook's Macbook on 2016. 6. 19..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *whaleBack;
@property (weak, nonatomic) IBOutlet UIButton *whaleForward;
@property (weak, nonatomic) IBOutlet UIButton *refresh;
@property (nonatomic) IBOutlet UITextField *url;
@property (weak, nonatomic) IBOutlet UIButton *Google;
@property (weak, nonatomic) IBOutlet UIButton *Facebook;
@property (weak, nonatomic) IBOutlet UIButton *Behance;
@property (weak, nonatomic) IBOutlet UIButton *Daum;
@property (weak, nonatomic) IBOutlet UIButton *Github;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIView *favoriteView;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *favorite;
@property (nonatomic, weak)IBOutlet UIImage *whaleWeb;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateLayout];
    [self buttonAction];
    [self favoriteButtonAction];
    _url.delegate = self;
    _webView.delegate = self;
    _url.placeholder = @"search or type URL";
    _url.textAlignment = NSTextAlignmentCenter;
    _whaleBack.enabled = NO;
    _whaleForward.enabled = NO;
    
}

//웹뷰 설정
-(void)webProperty {
    
    _webView.scrollView.scrollEnabled = YES;
    if ([_url.text isEqual: @"http://fastcampus.com"]){
        [_webView loadHTMLString:@"Warning! Virus Detected" baseURL:nil];
    }else {
        NSURL *url = [NSURL URLWithString:_url.text];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
    }
}

//현재 웹사이트의 URL표시 및 앞으로가기 뒤로가기 버튼 활성화 여부 결정 함수
-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [_url setText:_webView.request.mainDocumentURL.absoluteString];
    if (_webView.canGoBack) {
        _whaleBack.enabled = YES;
    }else {
        _whaleBack.enabled = NO;
        
    }if (webView.canGoForward) {
        _whaleForward.enabled = YES;
    }else {
        _whaleForward.enabled = NO;
    }
}

//잘못된 url을 입력하였을 경우 google에서 검색하도록 함
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://google.com/search?q=%@",_url.text]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}
//재검색을 하였을 때, 주소창 리셋을 위한 함수
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    _url.textAlignment = NSTextAlignmentLeft ;
    [_url setText:@""];
    return YES;
}

//주소 작성 완료하였을 때, 키보드 내려가줌
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self webProperty];
    [_url resignFirstResponder];
    
    return YES;
}

//앞으로가기 뒤로가기 버튼 설정
-(void)buttonAction {
    [_whaleBack addTarget:self action:@selector(actionWhaleBack:) forControlEvents:UIControlEventTouchUpInside];
    [_whaleForward addTarget:self action:@selector(actionWhaleForward:)forControlEvents:UIControlEventTouchUpInside];
    [_refresh addTarget:self action:@selector(actionRefresh:) forControlEvents:(UIControlEventTouchUpInside)];
    _whaleForward.layer.cornerRadius=5;
    _whaleBack.layer.cornerRadius=5;
    
}

//액션값 지정해주기
-(IBAction)actionWhaleBack:(UIButton *)sender {
    [_webView goBack];
}
-(IBAction)actionWhaleForward:(UIButton *)sender{
    [_webView goForward];
}

-(IBAction)actionRefresh:(UIButton *)sender{
    [_webView reload];
}

//즐겨 찾기 버튼 선언 및 Action 넣어주기


//즐겨찾기 버튼
-(void)favoriteButtonAction {
    [_Facebook addTarget:self action:@selector(actionGoFacebook:) forControlEvents:UIControlEventTouchUpInside];
    [_Github addTarget:self action:@selector(actionGoGithub:) forControlEvents:UIControlEventTouchUpInside];
    [_Behance addTarget:self action:@selector(actionGoBehance:) forControlEvents:UIControlEventTouchUpInside];
    [_Daum addTarget:self action:@selector(actionGoDaum:) forControlEvents:UIControlEventTouchUpInside];
    [_Google addTarget:self action:@selector(actionGoGoogle:) forControlEvents:UIControlEventTouchUpInside];
}

-(IBAction)actionGoFacebook:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://facebook.com"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

-(IBAction)actionGoGithub:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://Github.com"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

-(IBAction)actionGoBehance:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://Behance.com"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

-(IBAction)actionGoDaum:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://Daum.net"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

-(IBAction)actionGoGoogle:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://Google.com"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}


//set frame
- (void)updateLayout {
    
    //상단 url view
    [self.view addSubview:_topView];
    [_topView addSubview:_whaleForward];
    [_topView addSubview:_whaleBack];
    [_topView addSubview:_url];
    [_topView addSubview:_refresh];
    _topView.alpha = 0.8;
    _favoriteView.alpha = 0.9;
    _lineView.alpha = 0.8;
    
    _topView.frame = CGRectMake(0, 20, self.view.frame.size.width, 40);
    _whaleBack.frame = CGRectMake(10, 5, 30, 30);
    _whaleForward.frame = CGRectMake(45, 5, 30, 30);
    _url.frame = CGRectMake(85, 5, _topView.frame.size.width-130, 30);
    _refresh.frame = CGRectMake(_topView.frame.size.width-35, 10, 20, 20);
    
    //line View
    [self.view addSubview:_lineView];
    _lineView.frame = CGRectMake(0, 60, self.view.frame.size.width, 30);
    
    // favorite view
    [self.view addSubview:_favoriteView];
    _favoriteView.frame = CGRectMake(0, 62, self.view.frame.size.width, 30);
    
    //favorite icon insert
    NSInteger offsetX = 85;
    
    [_favoriteView addSubview:_favorite];
    _favorite.textAlignment = NSTextAlignmentCenter;
    _favorite.frame = CGRectMake(offsetX, 5, 70, 20);
    
    [_favoriteView addSubview:_Google];
    _Google.frame = CGRectMake(offsetX, 5, 20, 20);
    offsetX += _Google.frame.size.height + 15;
    
    [_favoriteView addSubview:_Facebook];
    _Facebook.frame = CGRectMake(offsetX, 5, 20, 20);
    offsetX += _Facebook.frame.size.height +15;
    
    [_favoriteView addSubview:_Behance];
    _Behance.frame = CGRectMake(offsetX, 5, 20,20);
    offsetX += _Behance.frame.size.height +15;
    
    [_favoriteView addSubview:_Github];
    _Github.frame = CGRectMake(offsetX, 5, 20, 20);
    offsetX += _Github.frame.size.height +15;
    
    [_favoriteView addSubview:_Daum];
    _Daum.frame = CGRectMake(offsetX, 5, 20, 20);
    offsetX += _Daum.frame.size.height +15;
    
    //webView
    [self.view addSubview:_webView];
    _webView.frame = CGRectMake(0, 92, self.view.frame.size.width, self.view.frame.size.height-92);
    
}


@end
