//
//  RequestObject.h
//  ImageNetworking
//
//  Created by JoSeongGyu on 2016. 6. 13..
//  Copyright © 2016년 yagom. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *ImageListUpdatedNotification = @"ImageListUpdated";
static NSString *ImageListUpdateFailNotification = @"ImageListUpdateFail";
static NSString *ImageUploadDidSuccessNotification = @"ImageUploadSuccess";
static NSString *ImageUploadDidFailNotification = @"ImageUploadFail";

static NSString *JSONKeyImageURL = @"image_url";
static NSString *JSONKeyThumbnailURL = @"thumbnail_url";
static NSString *JSONKeyImageTitle = @"title";

@interface RequestObject : NSObject

@property (nonatomic, strong) NSArray *imageInfoJSONArray;
@property (nonatomic, strong) NSString *userID;
+ (instancetype)sharedInstance;

- (void)uploadImage:(UIImage *)image title:(NSString *)title;
- (void)requestImageList;

@end
