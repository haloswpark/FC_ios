//
//  ViewController.m
//  UIScrollView
//
//  Created by Sangwook's Macbook on 2016. 5. 27..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic) CGRect frame;
@property(nonatomic) CGRect bounds;
@property(nonatomic) CGPoint center;
@property(nonatomic,copy) UIColor *backgroundColor;
@property(nonatomic) CGFloat alpha;
@property(nonatomic,getter=isHidden) BOOL hidden;
@property(nonatomic) UIViewContentMode contentMode;
@property(nonatomic,strong) UIColor *tintColor;

@property(nonatomic)CGPoint contentOffset;
@property(nonatomic)CGSize contentSize;
@property(nonatomic, weak) id<UIScrollViewDelegate> delegate;
@property(nonatomic) BOOL bounces; //pounces past edge of content and back again
@property(nonatomic, getter=isPagingEnabled) BOOL pagingEnable;
@property(nonatomic, getter=isScrollEnabled) BOOL scrollEnable;
@property(nonatomic) CGFloat minimumZoomScale;//default is 1.0
@property(nonatomic) CGFloat maximumZoomScale;//default is 1.0.mustbe zoom scale to enable zooming

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *myView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    [myView1 setBackgroundColor:[UIColor blueColor]];

    UIView *myView2 = [[UIView alloc]initWithFrame:CGRectMake
    (myView1.frame.size.width, 0,self.view.frame.size.width, self.view.frame.size.height)];
        [myView2 setBackgroundColor:[UIColor purpleColor]];
        
    UIView *myView3 = [[UIView alloc]initWithFrame:CGRectMake
    (myView2.frame.size.width*2, 0,self.view.frame.size.width,self.view.frame.size.height)];
            [myView3 setBackgroundColor:[UIColor yellowColor]];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 460)];
    //컨텐츠 사이즈 조정
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width*2, 460)];
    //델리게이트 설정
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    //추가뷰 1
    [scrollView addSubview:myView1];
    //추가뷰 2
    [scrollView addSubview:myView2];
  
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

