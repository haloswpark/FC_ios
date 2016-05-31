//
//  ViewController.m
//  HW_webView(storyboard)
//
//  Created by Sangwook's Macbook on 2016. 5. 30..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *toolbarView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) UIScrollView *scrollView;
@property (nonatomic) NSInteger offsetY;
@property (nonatomic) CGPoint toolbarTempPoint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 뒤로가기, 앞으로가기 비활성화
    self.backButton.enabled = NO;
    self.nextButton.enabled = NO;
    
    //델리게이트
    self.urlTextField.delegate=self;
    self.webView.delegate=self;
    self.webView.scrollView.delegate=self;
    
    //로딩표시
    self.activityIndicator.hidden= YES;
    
    //스크롤 뷰를 이용해 밑에 웹뷰 드래그 할 떄 하단바 숨기는 테스트.
    self.offsetY = 0;
    self.scrollView=self.webView.scrollView;
    self.toolbarTempPoint = self.toolbarView.frame.origin;
    
    //스크롤 테스트용으로 네이버 팝업
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.facebook.com"]]];
    //##검색 아이콘 이미지 텍스트 필드 왼쪽에 넣기
    //UIImageViuew *imageView = [[UIImageView alloc]initWithImage: [UIImage imageNamed:@"search"]];
    //self.urlTextField.leftview=imageView;
}


/*******Action********/

//새로고침 Action
-(IBAction)onTouchupReload:(id)sender{
    [self.webView reload];
}

//앞으로가기 Action
-(IBAction)onTouchUpGoFoward:(id)sender {
    [self.webView goForward];
}

//뒤로가기 Action
-(IBAction)onTouchUpGoBack:(id)sender{
    [self.webView goBack];
}

/********Delegate 선언*******/

//스크롤이 서서히 멈췄을때 발생하는 Delegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // NSLog(@"이전 Y좌표 : %ld, 스크롤뷰 offset Y : %f", self.offsetY, slef.scrollView.contentOffset.y);
    __weak ViewController *wself = self;
    
    if(self.offsetY < self.scrollView.contentOffset.y){
        NSLog(@"scroll up");
        wself.toolbarView.hidden = YES;
        }
    if (0<self.scrollView.contentOffset.y){
        self.offsetY = self.scrollView.contentOffset.y;
    }
}

// web불러오기 실패할 경우 Delegate
-(void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error {
    NSLog(@"%@",error);
    
//주소를 못 불러왔을 경우 에러 메시지 webView에 표현
    [self.webView loadHTMLString:[NSString stringWithFormat:@"<html><body>%@</body></html>",error.localizedDescription]baseURL:nil];
}

//webDidStartLoad를 호출하기 전 어떠한 요청을 처리해야할 경우 이 메소드를 호출
-(BOOL)webView:(UIView *)webView
shouldStartLoadWithRequest:(nonnull NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    //주소창에서 www.fastcampus.co.kr.를 접근할때 페이지를 막는 조건. return No가 되면 viewDidStartLoad가 실행되지 않음.
    if(navigationType == UIWebViewNavigationTypeOther && [request.URL.absoluteString isEqualToString:@"http://www.fastcampus.co.kr/"]){
        [self.webView loadHTMLString:[NSString stringWithFormat:@"<html><body>페이지를 표시할 수 없습니다.</body></html>"] baseURL:nil];
        return NO;
    }
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
}

//WEB 다 불러져 왔을 경우의 Delegate
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    self.urlTextField.text = webView.request.URL.absoluteString;
    self.offsetY=0;
    
    //뒤로가기 정보가 없을 경우
    if (webView.canGoBack) {
        self.backButton.enabled = YES;
    }
    else {
        self.backButton.enabled = NO;
    }
    //앞으로가기 정보가 없을 경우
    if (webView.canGoForward){
        self.nextButton.enabled = YES;
    }
    else {self.nextButton.enabled = NO;}
    
    self.activityIndicator.hidden=YES;
    [self.activityIndicator stopAnimating];
}

//키보드 return 버튼 눌렀을 경우의 Delegate
-(BOOL)textFieldShouldReturn:
(UITextField *)textField {
    NSString *urlString = self.urlTextField.text;
    
    //http://가 없을때 붙여주기
    if (![urlString hasPrefix:@"http://"]){
        urlString =[NSString stringWithFormat:@"http://%@", urlString];
    }
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
    
    [self.urlTextField resignFirstResponder];
    
    return YES;
}

//textField가 editing 되었을 경우, 텍스트를 좌측 정렬해주고 textField text를 전체선택
-(void)textFrieldDidBeginEditing:(UITextField *)textField {
    self.urlTextField.textAlignment = NSTextAlignmentLeft;
    
    //텍스트 필드에 적혀있는 글자들 전체 선택
    [self.urlTextField selectAll:textField];
}

//textfield가 Editing을 마무리하였을 때 다시 중간정렬하기.
-(void)textFieldDidEndEditing:
(UITextField *)textField {
    self.urlTextField.textAlignment = NSTextAlignmentCenter;
}

@end