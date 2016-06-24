//
//  ImageTableViewController.m
//  ImageNetworking
//
//  Created by JoSeongGyu on 2016. 6. 13..
//  Copyright © 2016년 yagom. All rights reserved.
//

#import "ImageTableViewController.h"
#import "RequestObject.h"
#import "ImageViewController.h"

@interface ImageTableViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) NSArray *imageInfos;

@end

@implementation ImageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(refreshTable)
                                                 name:ImageListUpdatedNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:[RequestObject sharedInstance]
                                             selector:@selector(requestImageList)
                                                 name:ImageUploadDidSuccessNotification
                                               object:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if ([[RequestObject sharedInstance] userID] == nil) {
        [self showUserIdAlert];
    }
}

- (void)showUserIdAlert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"유저 ID 입력"
                                                                   message:@"유저 ID를 입력해주세요"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                         if (alert.textFields.firstObject.text.length == 0 ||
                                                             [alert.textFields.firstObject.text containsString:@" "]) {
                                                             [self showUserIdAlert];
                                                         } else {
                                                             [[RequestObject sharedInstance] setUserID:alert.textFields.firstObject.text];
                                                             self.navigationItem.title = alert.textFields.firstObject.text;
                                                             [[RequestObject sharedInstance] requestImageList];
                                                         }
                                                     } ];
    
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"100~150 사이의 숫자";
        textField.keyboardType = UIKeyboardTypeNumberPad;
    }];
    
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)clickUploadButton:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    [imagePicker setDelegate:self];
    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (IBAction)clickLoadImageListButton:(id)sender {
    [[RequestObject sharedInstance] requestImageList];
}

#pragma mark - Image picker controller delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
   
    UIImage *image = nil;
    
    if (info[UIImagePickerControllerEditedImage]) {
        image = info[UIImagePickerControllerEditedImage];
    } else {
        image = info[UIImagePickerControllerOriginalImage];
    }
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"사진제목"
                                                                   message:@"사진제목을 입력해주세요"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                         if (alert.textFields.firstObject.text.length == 0) {
                                                         } else {
                                                             NSString *imageTitle = alert.textFields.firstObject.text;
                                                             [[RequestObject sharedInstance] uploadImage:image
                                                                                                   title:imageTitle];
                                                         }
                                                     } ];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             
                                                         }];
    
    [alert addAction:cancelAction];
    
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"사진제목";
    }];
    
    [alert addAction:okAction];
    
    [picker dismissViewControllerAnimated:YES
                               completion:^{
                                   [self presentViewController:alert animated:YES completion:nil];
                               }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imageInfos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell" forIndexPath:indexPath];
    
    NSDictionary *imageInfo = self.imageInfos[indexPath.row];
    
    NSString *imageTitle = imageInfo[JSONKeyImageTitle];
    cell.textLabel.text = imageTitle;
    
    NSString *thumbnailURLString = imageInfo[JSONKeyThumbnailURL];
    NSURL *thumbnailURL = [NSURL URLWithString:thumbnailURLString];
        
    cell.imageView.image = [UIImage imageNamed:@"placeholder"];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:thumbnailURL]];
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:thumbnailURL
                                                         completionHandler:^(NSData * _Nullable data,
                                                                             NSURLResponse * _Nullable response,
                                                                             NSError * _Nullable error) {
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            if (image) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    UITableViewCell *cellForUpdate = [tableView cellForRowAtIndexPath:indexPath];
                    cellForUpdate.imageView.image = image;
                });
            }
        }
    }];
    
    [task resume];
    
    
    return cell;
}


- (void)refreshTable {
    self.imageInfos = [[RequestObject sharedInstance] imageInfoJSONArray];
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        [self.tableView reloadData];
    });
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    UITableViewCell *cell = sender;
    
    NSIndexPath *cellIndex = [self.tableView indexPathForCell:cell];
    
    NSDictionary *imageInfo = self.imageInfos[cellIndex.row];
    
    ImageViewController *nextViewController = segue.destinationViewController;
    
    nextViewController.imageURLString = imageInfo[JSONKeyImageURL];
    
}

@end
