//
//  SecondViewController.m
//  TabbarControllerExample
//
//  Created by Sangwook's Macbook on 2016. 6. 14..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"
#import "DataCenter.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *SecondTVlabel;
@property (strong, nonatomic)DataCenter *dataCenter;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataCenter = [DataCenter sharedInstance];
}


- (void)viewWillAppear:(BOOL)animated {

    //ViewController *VC1 = self.navigationController.viewControllers.firstObject;
    //self.SecondTVlabel.text = VC1.TVlabel.text;
    self.SecondTVlabel.text = self.dataCenter.tempString;
    
   
    
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
