//
//  ViewController.m
//  AlertExercise
//
//  Created by Sangwook's Macbook on 2016. 6. 10..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)clickActionsheetButton:(id)sender {
    
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                         NSLog(@"Alert OK");
                                                     }];
    
    
    UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:@"파괴"
                                                                style:UIAlertActionStyleDestructive
                                                              handler:^(UIAlertAction * _Nonnull action) {
                                                                  NSLog(@"Alert Destructive");
                                                              }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             NSLog(@"Alert Cancel");
                                                         }];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert!"
                                                                   message:@"Alert Style"
                                                            preferredStyle:UIAlertControllerStyleActionSheet];

    
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    [alert addAction:destructiveAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)clickAlertButton:(id)sender {

    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                     NSLog(@"Alert OK");
                                                     }];
    
    
    UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:@"파괴"
                                                          style:UIAlertActionStyleDestructive
                                                          handler:^(UIAlertAction * _Nonnull action) {
                                                          NSLog(@"Alert Destructive");
                                                              }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소"
                                                         style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                         NSLog(@"Alert Cancel");
                                                         }];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert!"
                                                  message:@"Alert Style"
                                                  preferredStyle:UIAlertControllerStyleAlert];
    
    
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    [alert addAction:destructiveAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    //ALERT Cancel2 값을 신규로 넣어보려고 했으나 자동 튕김.

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

