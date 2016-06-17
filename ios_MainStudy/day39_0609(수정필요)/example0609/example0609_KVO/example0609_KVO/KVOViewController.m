//
//  KVOViewController.m
//  example0609_KVO
//
//  Created by Mookie on 2016. 6. 9..
//  Copyright © 2016년 Mookie. All rights reserved.
//

#import "KVOViewController.h"

@interface KVOViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (nonatomic) NSInteger count;
@property (nonatomic) NSInteger count2;
@end

@implementation KVOViewController
- (IBAction)clickButton:(id)sender {
    self.count++;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //forKeyPath : 감시하고자 하는 변수 이름
    //NSKeyValueObservingOptionNew : 새로운 값 만 체크
    //NSKeyValueObservingOptionOld : 새로운 값과 기존의 값 체크
    [self addObserver:self forKeyPath:@"count" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];

}


//값이 변경이 되면 호출되는 메서드
//change - 옵션에 따라 기존값, 새로운 값, 상태 값 등이 NSDictionary 로 저장되어 있음
-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSString *,id> *)change
                      context:(void *)context {
    NSLog(@"%@",keyPath);
    NSLog(@"%@",change);

    NSNumber *kindValue = [change objectForKey:NSKeyValueChangeKindKey];
    NSNumber *newValue = [change objectForKey:NSKeyValueChangeNewKey];
    
    NSLog(@"%zd_%@", kindValue.integerValue, newValue);
    [self.countLabel setText:[NSString stringWithFormat:@"%@", newValue]];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
