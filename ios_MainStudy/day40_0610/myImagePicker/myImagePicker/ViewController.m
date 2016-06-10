//
//  ViewController.m
//  myImagePicker
//
//  Created by Sangwook's Macbook on 2016. 6. 10..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "ViewController.h"
@import UIKit;
@interface ViewController ()
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapAction;

@end

@implementation ViewController


- (IBAction)touchImageView:(id)sender {
    
    UIAlertAction *libraryAction = [UIAlertAction actionWithTitle:@"라이브러리" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"라이브러리 선택");
        [self showImagePickerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        }];
    
    
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"카메라"
    style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        NSLog(@"카메라 선택");
        [self showImagePickerWithSourceType:UIImagePickerControllerSourceTypeCamera];

    }];
    
//    UIAlertAction *albumloadAction = [UIAlertAction actionWithTitle:@"사진앨범"
//    style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"사진앨범 로드");
//    }];
//    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소"
    style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Action sheet Cancel");
        }];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"사진소스 선택"message:@"가져올 사진을 선택해주세요"preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alert addAction:libraryAction];
    [alert addAction:cameraAction];
    [alert addAction:cancelAction];

//    [alert addAction:destructiveAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    NSLog(@"Image view touched");
}

-(void)showImagePickerWithSourceType: (UIImagePickerControllerSourceType)sourceType{
    //소스타입을 파라미터로 넣어준 이유 = 이미지 피커 중 어떤 소스를 사용할 것인지 알려주기 때문에 라이브러리에서 사용할 수 있도록 편하게 명령할 수 있도록 만들어졌음
    
    if([UIImagePickerController isSourceTypeAvailable:sourceType] == NO){
        //사용자에게 얼럿을 보여주지만, 우리에겐 얼럿 코드를 볼 수 있도록함
        
        //우리는 이 소스를 사용하지 못함
        NSLog(@"이 소스는 못쓴단다");
        return;
    }
    UIImagePickerController *pickerController = [[UIImagePickerController alloc]init];
    [pickerController setSourceType:sourceType];
    [pickerController setDelegate:self];
    
    [self presentViewController:pickerController animated:YES completion:nil];
}

#pragma mark - UIImagePicker Controller Delegate
-(void)imagePickerControllerDidCancel: (UIImagePickerController *)picker {
    //Picker 모달을 내려준다
    [picker dismissViewControllerAnimated:YES completion:nil];
}

//나머지 처리를 하라고 메소드로 보내주는 역할 / 딕셔너리에는 이미지 파일들이 들어와진다.
-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(nonnull NSDictionary<NSString *,id> *)info{
    
    
    UIImage *pickedOriginalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self.imageView setImage:pickedOriginalImage];
    
    //딕셔너리 키 변경 (UIImgagePickerControllerOriginalImage는 얼마든지 변경 가능함)
    UIImage *editedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.imageView.image = editedImage;
    
    //contentModeScale
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    NSLog(@"didFinish");
    NSLog(@"%@", pickedOriginalImage);
    [picker dismissViewControllerAnimated:YES completion:nil];
}

//
//-(void)getImagePickerFromAlbum {
//    
//    UIImagePickerController *imagePicker = [[UI]]
//          }
//          

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
