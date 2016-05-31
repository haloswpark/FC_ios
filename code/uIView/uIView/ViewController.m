//
//  ViewController.m
//  uIView
//
//  Created by Sangwook's Macbook on 2016. 5. 24..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    
//UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2, self.view.frame.size.height)];
//[leftView setBackgroundColor:[UIColor redColor]];
//[self.view addSubview:leftView];
//
//
//UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, leftView.frame.size.width, leftView.frame.size.width)];
//[leftView setBackgroundColor:[UIColor blueColor]];
//[leftView addSubview:topView];
//    
//UIView *rightView = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2, 0, self.view.frame.size.width/2, self.view.frame.size.height)];
//[rightView setBackgroundColor:[UIColor blueColor]];
//[self.view addSubview:rightView];
//
//UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2, self.view.frame.size.height)];
//[leftView setBackgroundColor:[UIColor redColor]];
//[rightView addSubview:bottomView];
//
//    
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
    
//    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(20, 20, self.view.frame.size.width-40, self.view.frame.size.height-40)];
//    //RGB값을 입력하고 싶을 때, UIColor *color = [[UIColor alloc]initWithRed:233/255 green:135/255 blue:238/225 alpha:1];
//    //[leftView setBackgroundColor:color];
//    [leftView setBackgroundColor:[UIColor grayColor]];
//    [self.view addSubview:leftView];
//    
//    UIView *rightView = [[UIView alloc]initWithFrame:CGRectMake(20, 20, leftView.frame.size.width-40,leftView.frame.size.height-40)];
//    [rightView setBackgroundColor:[UIColor whiteColor]];
//    [leftView addSubview:rightView];
//    
    
//    //UILabel 예제
//    UIView *halfView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2)];
//    UILabel *myLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, halfView.frame.size.width-40, 35)];
//    UILabel *myLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, halfView.frame.size.width-40, 35)];
//    [self.view addSubview: halfView];
//    [halfView addSubview:myLabel];
//    [halfView addSubview:myLabel2];
//    
//    [myLabel setText:@"첫번쨰 레이블"];
//    [myLabel setTextColor:[UIColor blueColor]];
//    [myLabel setTextAlignment:NSTextAlignmentCenter];
//    
//    [myLabel2 setText:@"두번째 레이블"];
    
//추가로 공부 반드시 해야함!!!!!!
    
//    const CGFloat VIEW_MARGIN=20;
//    CGSize labelSize = CGSizeMake(self.view.frame.size.width - VIEW_MARGIN*2, 30);
//    
//    CGFloat offsetY = VIEW_MARGIN;
//    
//
//    UILabel *firstLb = [[UILabel alloc]initWithFrame:CGRectMake(VIEW_MARGIN, offsetY, labelSize.width, labelSize.height)];
//    firstLb.text = @"예제화면";
//    firstLb.textAlignment = NSTextAlignmentLeft;
//    [self.view addSubview:firstLb];
//    offsetY += firstLb.frame.size.height;
//    
//    UILabel *secondtLb = [[UILabel alloc]initWithFrame:CGRectMake(VIEW_MARGIN, offsetY, labelSize.width, labelSize.height)];
//    secondLb.text = @"예쁜화면";
//    secondLb.textAlignment = NSTextAlignmentRight;
//    [self.view addSubview:secondLb];
//    offsetY += secondLb.frame.size.height;
//
//    UILabel *thirdLb = [[UILabel alloc]initWithFrame:CGRectMake(VIEW_MARGIN, offsetY, labelSize.height, labelSize.width)];
//    
//    
//    UIView *secondView = [[UILabel alloc]initWithFrame:CGRectMake(VIEW_MARGIN, offsetY, labelSize.width, labelSize.height)];
//    firstLb.text = @"예쁜화면";
//    firstLb.textAlignment = NSTextAlignmentLeft;
//    [self.view addSubview:secondLb];
//    offsetY += secondLb.frame.size.height;
//    
//    UILabel *innerLb = [UILabel alloc]

    UIImageView *imgView = [[UIImageView alloc]initWithFrame: CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height)];
    [imgView setImage: [UIImage imageNamed: @"tumblr_o4wv490Gni1u16n75o1_1280.jpg"]];
    [imgView setContentMode:UIViewContentModeScaleAspectFill];
    [self.view addSubview:imgView];
    
}

@end
