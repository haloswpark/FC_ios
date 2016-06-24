//
//  ViewController.m
//  ImageNetwork
//
//  Created by Sangwook's Macbook on 2016. 6. 24..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>

static NSString *ImageListUpdateNotificaiton = @"ImageListUpdated";
static NSString *ImageListUpdateFailNotification = @"ImageListUpdateFail";
static NSString *ImageUploadDidSuccessNotification = @"ImageUPloadSuccess";
static NSString *ImageUPloadDidFailNotification = @"ImageUploadFail";

@interface ViewController ()

@end

@implementation ViewController

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell" forIndexPath:indexPath];
    NSDictionary *imageInfo = self.imageInfos[indexPath.row];
    
    NSString *imageTitle = ImageInfo[JSONKeyImageTitle];
    cell.textLabel.text = imageTitle;
    
    NSString *thumbnailURLString = imageInfo[JSONKeyThumbnailURL];
    NSURL *thumbnailURL = [NSUrl URLWithString:thumbnailURLString];
    
    cell.imageView.image = [UIImage imageNamed:@"placeholder"];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:thumbnailURL]];
    NSURLSessionTask *task = [[NSURLSession sharedSession]dataTaskWithURL:thumbnailURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError *_Nullable error){
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

-(void)refreshTable {
    self.iamgeInfos = [[RequestObject sharedInstance] imageInfoJSONArray];
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        [self.tableView reloadData];
    });
}

- (void)uploadImage:(UIImage *)image title:(NSString *)title {
    NSLog(@"uploadd image &@", title);
    
    NSString *boundary = @"----------sangwook";
    NSString *contentType = [NSString stringWithFormat: @"multipart/form-data; boundary = %@", boundary];
    
    NSString *imageUplodadURLString = @"http://ios.yevgnenll.me/api/images";
    NSURL * requestURL = [NSURL URLWithString: [baseURLString stringByAppendingString:@"/api/images/"];
                          
        [body appendData: imageDataKeyData];
        [body apeendData:imageData];
                          
    NSData *finishBoundaryData = [[NSString srtingWithFormat:@"--%@--\n", boundary] dataUsingEncoding:NSUTF8StringIncoding];
        [body append Data: finishBoundaryData];
        [request setHTTPBody :body];
                          
                          
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request fromData:nil completitionHandler: ^(NSData *_Nullable response, NSError *_Nullable error) {
        
        if error != nil) {
            NSLog(@"Error Occured : %@", error);
            return;
        }
        if (data == nil) {
            NSLog(@"Data doesn't exist");
            return;
        }
        
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJASONReadingMutableLeaves error:nil];
        
        NSLog(@"%@",dict);
    }];
                          
   [uploadTask resume]; //upload start
                          
   NSString *boundary = @"--------yagom";
   NSString *contentType = [NSString stringWithFormat: @"multipart/form-data; boundary=%@",boundary];
   NSString *imageUploadURLString = @"http://ios.yevgnell.me/api/images/";
   NSURL *RequestURL =[NSString URLWithString:imageUploadURLString];
                          
   //create request
   NSMutableURLRequest
}
   NSData *boundaryData = [[NSString stringWithFormat:@"\n--%@\n",boundary]dataUsingEncoding:NSUTF8StringEncoding];
                           
   for (NSString *key in bodyParams) {
    [body appendData:boundaryData];
       NSData *valueKeyData = [[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\n\n",key]dataUsingEncoding:NSUTF8StringEncoding];
       [body appendData:valueData];
    }
       [body appendData: boudnaryData];
   NSData *imageKeyData = [[NSString stringWithString:[NSString stringWithFormat:@"Content-Disposition: form-data; name\"image_data\"; filename=\"image.jpeg\"\n"]] dataUsingEncoding: NSUTF8StringEncoding];
                          
   UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"사진제목" message:@"사진제목을 입력해주세요" preferredStyle:UIAlertControllerStyleAlert];

   UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        if (alert.textFields.firstObject.text.length == 0){}
        else {
            self.imageTitle = alert.textFields.firstObject.text;
            self.imageToUpload = image;
            
            [[RequestObject sharedInstance]uploadImage: image title:self.imageTitle];
            
            [self requestUploadImage:self.imageToUpLoad title:self.imageTitle];
        }
    }];
                          
[[alert addAction:cancelAction];[alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textfield) {
    textfield.placeholder = @"사진제목";
}];
    [alert addAction:okAction];
                          
    [picker dismissViewControllerAnimated:YES completion:^{
    [slef presentViewController:alert animated:YES completion:nil];
    }];
    
-(void) requestImageList {
 NSString *URLString = [NSString stringWithFormat:@"http://ios.yevgnll.me/api/images/?user_id=%@",self.userID];
 NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
 [request setHTTPMethod:@"GET"];
 [request setURL:requestURL];
                              
 NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession]dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error){
          NSLog(@"%@", response);
          NSLog(@"%@", error);
                                  
   if (data) {
     NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options: NSJSONMutableLeaves error:nil];
       
       NSLog("@%@",dict);
       NSLog(@"%@",self.imageInfoJSONArray);
    }
 }];


[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];

[dataTask resume];
    
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
