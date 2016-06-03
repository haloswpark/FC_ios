//
//  ViewController.h
//  myCacluator
//
//  Created by Sangwook's Macbook on 2016. 6. 1..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    //총 계산 결과값을 나타내는 변수
    NSInteger resultNum;
    
    //연산기호를 넣어주는 버퍼
    NSString *operatorBuffer;
    
    //화면에 나타나는 내용
    NSString *displayText;

}


//UI TextField 프로퍼티 선언
@property(nonatomic,weak) IBOutlet UITextField *displayTextField;


@end

