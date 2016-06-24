//
//  RequestObject.m
//  ImageNetworking
//
//  Created by JoSeongGyu on 2016. 6. 13..
//  Copyright © 2016년 yagom. All rights reserved.
//

#import "RequestObject.h"

static NSString *JSONKeyContent = @"content";
static NSString *JSONKeyResultCode = @"code";

@interface RequestObject ()

@end

@implementation RequestObject

+ (instancetype)sharedInstance
{
    static RequestObject *object = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[RequestObject alloc] init];
    });
    
    return object;
}

- (void)uploadImage:(UIImage *)image title:(NSString *)title {

    NSLog(@"upload image %@", title);
    
    NSString *boundary = @"-----------------yagom";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    
    NSString *imageUploadURLString = @"http://ios.yevgnenll.me/api/images/";
    NSURL *requestURL = [NSURL URLWithString:imageUploadURLString];

    // create request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"POST"];
    [request setURL:requestURL];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    NSMutableData *body = [NSMutableData data];
    
    NSMutableDictionary *bodyParams = [[NSMutableDictionary alloc] init];
    [bodyParams setObject:self.userID
                   forKey:@"user_id"];
    
    [bodyParams setObject:title
                   forKey:@"title"];;
    
    NSData *boundaryData = [[NSString stringWithFormat:@"\n--%@\n", boundary] dataUsingEncoding:NSUTF8StringEncoding];
    
    for (NSString *key in bodyParams) {
        
        [body appendData:boundaryData];
        
        NSData *valueKeyData = [[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\n\n", key] dataUsingEncoding:NSUTF8StringEncoding];
        [body appendData:valueKeyData];
        
        NSString *value = bodyParams[key];
        NSData *valueData = [[NSString stringWithFormat:@"%@\n", value] dataUsingEncoding:NSUTF8StringEncoding];
        [body appendData:valueData];
    }
    
    [body appendData:boundaryData];
    
    NSData *imageKeyData = [[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image_data\"; filename=\"image.jpeg\"\n"] dataUsingEncoding:NSUTF8StringEncoding];
    [body appendData:imageKeyData];
    
    NSData *imageContentTypeData = [@"Content-Type: image/jpeg\n\n" dataUsingEncoding:NSUTF8StringEncoding];
    [body appendData:imageContentTypeData];
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.1);
    [body appendData:imageData];
    
    NSData *finishBoundaryData = [[NSString stringWithFormat:@"\n--%@--\n",boundary] dataUsingEncoding:NSUTF8StringEncoding];
    [body appendData:finishBoundaryData];

    [request setHTTPBody:body];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request
                                                               fromData:nil
                                                      completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                          
                                                          if (error != nil) {
                                                              NSLog(@"Error occured : %@", error);
                                                              return;
                                                          }
                                                          
                                                          if (data == nil) {
                                                              NSLog(@"Data dosen't exist");
                                                              return;
                                                          }
                                                          
                                                          NSLog(@"%@", response);
                                                          
                                                          NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                                                                               options:NSJSONReadingMutableLeaves
                                                                                                                 error:nil];
                                                          NSLog(@"%@",dict);

                                                          if ([dict[JSONKeyResultCode] isEqualToNumber:@201]) {
                                                              [[NSNotificationCenter defaultCenter] postNotificationName:ImageUploadDidSuccessNotification
                                                                                                                  object:nil];
                                                          } else {
                                                              [[NSNotificationCenter defaultCenter] postNotificationName:ImageUploadDidFailNotification
                                                                                                                  object:nil];
                                                          }

                                                      }];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [uploadTask resume];
    
    
    
}

- (void)requestImageList {
    
    NSString *URLString = [NSString stringWithFormat:@"http://ios.yevgnenll.me/api/images/?user_id=%@", self.userID];
    NSURL* requestURL = [NSURL URLWithString:URLString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:requestURL];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request
                                                                     completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                                         NSLog(@"%@", response);
                                                                         NSLog(@"%@", error);
                                                                         
                                                                         if (data) {
                                                                             NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                                                                                                  options:NSJSONReadingMutableLeaves
                                                                                                                                    error:nil];
                                                                             
                                                                             
                                                                             if ([dict[JSONKeyResultCode] isEqualToNumber: @200]) {
                                                                                 NSLog(@"success");
                                                                                 
                                                                                 NSArray *contentArray = dict[JSONKeyContent];
                                                                                 self.imageInfoJSONArray = contentArray;
                                                                                 
                                                                                 [[NSNotificationCenter defaultCenter] postNotificationName:ImageListUpdatedNotification
                                                                                                                                     object:nil];
                                                                             } else {
                                                                                 [[NSNotificationCenter defaultCenter] postNotificationName:ImageListUpdateFailNotification
                                                                                                                                     object:nil];
                                                                             }
                                                                             
                                                                             NSLog(@"%@",dict);
                                                                             NSLog(@"%@", self.imageInfoJSONArray);
                                                                         }
                                                                     }];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    [dataTask resume];

    
}


@end
