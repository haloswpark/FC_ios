//
//  LoginViewController.h
//  Login_AutoLayout
//
//  Created by Sangwook's Macbook on 2016. 6. 7..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *backImg;

@property (weak, nonatomic) IBOutlet UILabel *welcome;

@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UITextField *idTf;
@property (weak, nonatomic) IBOutlet UITextField *pwTf;



@end
