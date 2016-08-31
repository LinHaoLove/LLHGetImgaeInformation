//
//  LLHGetImageInfoManager.h
//  GetInformationFromPhoto
//
//  Created by jit-mac on 16/8/30.
//  Copyright © 2016年 LLH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ImageIO/ImageIO.h>

@interface LLHGetImageInfoManager : NSObject{
@private
    CGImageSourceRef imageRef;
}
- (id)initWithURL:(NSURL*)imageUrl;
@property(nonatomic,strong) NSDictionary * imageExifDictionary;//照片Exif信息
@property(nonatomic,strong) NSDictionary * imageTiffDictionary;//照片Tiff信息
@property(nonatomic,strong) NSDictionary * imageProperty;//照片所有信息
@property(nonatomic,copy)   NSString * imageFileType;//照片Type
@property(nonatomic,assign) NSInteger  imageFileSize;//照片所拥有的字节数目

@end
