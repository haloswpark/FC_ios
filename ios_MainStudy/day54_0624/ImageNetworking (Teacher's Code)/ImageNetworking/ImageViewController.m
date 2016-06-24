//
//  ImageViewController.m
//  ImageNetworking
//
//  Created by JoSeongGyu on 2016. 6. 21..
//  Copyright © 2016년 yagom. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ImageViewController

- (IBAction)tapImageView:(id)sender {
    BOOL isNavibarHidden = self.navigationController.navigationBarHidden;
    [self.navigationController setNavigationBarHidden:!isNavibarHidden animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    
    NSURL *imageURL = [NSURL URLWithString:self.imageURLString];
    
//    [self.imageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:imageURL]]];
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:imageURL
                                                         completionHandler:^(NSData * _Nullable data,
                                                                             NSURLResponse * _Nullable response,
                                                                             NSError * _Nullable error) {
                                                             if (data) {
                                                                 UIImage *image = [UIImage imageWithData:data];
                                                                 if (image) {
                                                                     dispatch_async(dispatch_get_main_queue(), ^{
                                                                         self.imageView.image = image;
                                                                     });
                                                                 }
                                                             }
                                                         }];
    
    [task resume];
    
    
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];
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
