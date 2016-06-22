//
//  ImageViewController.m
//  NetworkingMiniProject
//
//  Created by Sangwook's Macbook on 2016. 6. 22..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()


@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    \
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
