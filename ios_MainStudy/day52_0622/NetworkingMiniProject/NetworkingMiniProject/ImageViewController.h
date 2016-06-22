//
//  ImageViewController.h
//  NetworkingMiniProject
//
//  Created by Sangwook's Macbook on 2016. 6. 22..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapAction;

@end
