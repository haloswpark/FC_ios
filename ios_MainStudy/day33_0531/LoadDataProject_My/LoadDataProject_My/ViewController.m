//
//  ViewController.m
//  project
//
//  Created by Sangwook's Macbook on 2016. 6. 2..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "ViewController.h"
#import "DataCenter.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UITextField *nameTF;

@end

@implementation ViewController

- (IBAction)onTouchUpInsideOK:(id)sender
{
    NSLog(@"------------------여기는 ViewController Action 입니다---------------------");
    [[DataCenter sharedInstance] setName:self.nameTF.text];
    [[DataCenter sharedInstance] printData];

}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"------------------여기는 viewWillAppear 입니다---------------------");
    [[DataCenter sharedInstance] printData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
