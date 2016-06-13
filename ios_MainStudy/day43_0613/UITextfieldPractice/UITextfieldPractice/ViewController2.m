//
//  ViewController2.m
//  UITextfieldPractice
//
//  Created by Sangwook's Macbook on 2016. 6. 13..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController.h"

@interface ViewController2 ()

@property (weak, nonatomic) IBOutlet UILabel *TFlabel2;

@end


@implementation ViewController2

/***********1번째 방법*************/

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ViewController *VC1 = self.navigationController.viewControllers.firstObject;
    self.TFlabel2.text = VC1.TFlabel.text;

}

@end