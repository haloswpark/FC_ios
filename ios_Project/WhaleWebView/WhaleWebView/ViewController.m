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

@property (nonatomic, weak)IBOutlet UIView *topView;
@property (nonatomic, weak)IBOutlet UIView *lineView;
@property (nonatomic, weak)IBOutlet UIView *favortieView;
@property (nonatomic, weak)IBOutlet UIButton *refresh;
@property (nonatomic, weak)IBOutlet UIButton *Facebook;
@property (nonatomic, weak)IBOutlet UIButton *Google;
@property (nonatomic, weak)IBOutlet UIButton *Github;
@property (nonatomic, weak)IBOutlet UIButton *Behance;
@property (nonatomic, weak)IBOutlet UIButton *Daum;
@property (nonatomic, weak)IBOutlet UIButton *whaleBack;
@property (nonatomic, weak)IBOutlet UIButton *whaleForward;
@property (nonatomic)IBOutlet UITextField *typeUrl;
@property (nonatomic, weak)IBOutlet UILabel *favorite;
@property (nonatomic, weak)IBOutlet UIWebView *webView;
@property (nonatomic, weak)IBOutlet UIImage *whaleWeb;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateLayout];
    [self buttonAction];
    [self buttonFavoriteAction];
    _typeUrl.delegate = self;
    _webView.delegate = self;
    _typeUrl.placeholder = @"search or type URL";
    _whaleBack.enabled = NO;
    _whaleForward.enabled = NO;
    
}

//웹뷰 설정
-(void)webProperty {
    
    _webView.scrollView.scrollEnabled = YES;
    if ([_typeUrl.text isEqual: @"http://fastcampus.com"]){
        [_webView loadHTMLString:@"Warning! Virus Detected" baseURL:nil];
    }else {
        NSURL *url = [NSURL URLWithString:_typeUrl.text];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
    }
}

//현재 웹사이트의 URL표시 및 앞으로가기 뒤로가기 버튼 활성화 여부 결정 함수
-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [_typeUrl setText:_webView.request.mainDocumentURL.absoluteString];
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
-(void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
    NSURL *url=[NSURL URLWithString:
    [NSString stringWithFormat:@"http://google.com/search?q=%@", _typeUrl.text]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

//재검색을 하였을 때, 주소창 리셋을 위한 함수
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [self webProperty];
    [_typeUrl resignFirstResponder];
    
    return YES;
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

//앞으로가기 뒤로가기 버튼 설정
-(void)buttonAction {
    [_whaleBack addTarget:self action:@selector(actionWhaleBack:) forControlEvents:UIContorlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
