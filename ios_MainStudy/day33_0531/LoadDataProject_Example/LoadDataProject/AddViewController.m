//
//  AddViewController.m
//  LoadDataProject
//
//  Created by Sangwook's Macbook on 2016. 6. 2..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "AddViewController.h"
#import "DataCenter.h"

@interface AddViewController ()

@property (nonatomic, weak)IBOutlet UITextField *nameTF;
@property (nonatomic, weak)IBOutlet UITextField *phoneNumTF;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)add:(id)sender
{
    [[DataCenter sharedInstance] addFriendInfo:self.nameTF.text phone:self.phoneNumTF.text];
    [self.navigationController popViewControllerAnimated:YES];
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
