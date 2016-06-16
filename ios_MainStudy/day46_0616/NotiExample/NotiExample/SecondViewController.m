//
//  SecondViewController.m
//  NotiExample
//
//  Created by Sangwook's Macbook on 2016. 6. 16..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UIButton *okBtn;

@property (weak, nonatomic) IBOutlet UITextField *inputTF;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(upKeyboard:) name:UIKeyboardDidShowNotification object:nil];
}

-(void)dealloc
{
    NSLog(@"dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)ChangeokBtn:(id)sender
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ChangeTextNoti" object:self.inputTF.text];
    [self.navigationController popViewControllerAnimated:YES];
}


@end
