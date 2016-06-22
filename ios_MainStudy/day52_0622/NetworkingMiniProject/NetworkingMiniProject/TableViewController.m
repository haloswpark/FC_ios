//
//  TableViewController.m
//  NetworkingMiniProject
//
//  Created by Sangwook's Macbook on 2016. 6. 22..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "TableViewController.h"
#import "ImageViewController.h"
@interface TableViewController ()
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *uploadBtn;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIAlertController * alert= [UIAlertController
    alertControllerWithTitle:@"Login"message:@"유저ID를 입력해주시길 바랍니다"preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        /*Actions*/
    }];
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:
        UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
    [alert dismissViewControllerAnimated:YES completion:nil];
                             }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Username";
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(IBAction)touchImageView:(id)sender {
    
UIAlertAction *libraryAction = [UIAlertAction actionWithTitle:@"라이브러리"style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    NSLog(@"라이브러리 선택");
    [self showImagePickerWithSourceType:
     UIImagePickerControllerSourceTypePhotoLibrary];
    }];
    
    
UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"카메라"
    style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
    NSLog(@"카메라 선택");
    [self showImagePickerWithSourceType:
    UIImagePickerControllerSourceTypeCamera];
    }];
    
    //    UIAlertAction *albumloadAction = [UIAlertAction actionWithTitle:@"사진앨범"
    //    style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    //        NSLog(@"사진앨범 로드");
    //    }];
    //
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소"
    style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){NSLog(@"Action sheet Cancel");
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
    //[self.imageView setImage:pickedOriginalImage];
    
    //딕셔너리 키 변경 (UIImgagePickerControllerOriginalImage는 얼마든지 변경 가능함)
    UIImage *editedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    //self.imageView.image = editedImage;
    
    //contentModeScale
    //self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    NSLog(@"didFinish");
    NSLog(@"%@", pickedOriginalImage);
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
