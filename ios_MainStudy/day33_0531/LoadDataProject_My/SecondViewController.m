//
//  SecondViewController.m
//  project
//
//  Created by Sangwook's Macbook on 2016. 6. 2..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "SecondViewController.h"
#import "DataCenter.h"
@interface SecondViewController ()

@property(nonatomic, weak) IBOutlet UITextField *ageTF;

@end

@implementation SecondViewController

-(IBAction)onTouchUpInside:(id)sender
{
    NSLog(@"------------------여기는 Second Action 입니다---------------------");
    [[DataCenter sharedInstance] setAge:self.ageTF.text.integerValue];
    [[DataCenter sharedInstance] printData];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
