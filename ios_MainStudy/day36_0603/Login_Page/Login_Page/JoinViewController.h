//
//  JoinViewController.h
//  Login_AutoLayout
//
//  Created by Sangwook's Macbook on 2016. 6. 7..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JoinViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *joinView;
@property (weak, nonatomic) IBOutlet UILabel *joinTitle;

@property (weak, nonatomic) IBOutlet UITextField *joinIDTF;
@property (weak, nonatomic) IBOutlet UITextField *joinPWTF;
@property (weak, nonatomic) IBOutlet UITextField *joinRePWTF;


@end

