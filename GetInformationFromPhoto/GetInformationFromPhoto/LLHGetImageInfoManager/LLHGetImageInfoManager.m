//
//  LLHGetImageInfoManager.m
//  GetInformationFromPhoto
//
//  Created by jit-mac on 16/8/30.
//  Copyright © 2016年 LLH. All rights reserved.
//

#import "LLHGetImageInfoManager.h"


@implementation LLHGetImageInfoManager


- (id)initWithURL:(NSURL*)imageUrl
{
    self = [super init];
    if (self) {
        imageRef = CGImageSourceCreateWithURL((__bridge CFURLRef)imageUrl, NULL);
        _imageProperty = (__bridge NSDictionary*)CGImageSourceCopyPropertiesAtIndex(imageRef, 0, NULL);
        _imageFileSize = [self fileSize];
        _imageFileType = [self fileType];
        
        self.imageExifDictionary = [self imageExifDictionaryGet];
        self.imageTiffDictionary = [self imageTiffDictionary];
    }
    return self;
}


-(NSDictionary *)imageExifDictionaryGet{
    return [_imageProperty valueForKey:(NSString*)kCGImagePropertyExifDictionary];
}
- (NSDictionary*)tiffDictonary{
    return [_imageProperty valueForKey:(NSString*)kCGImagePropertyTIFFDictionary];
}
- (NSInteger)fileSize
{
    CFDictionaryRef dict = CGImageSourceCopyProperties(imageRef, NULL);
    CFNumberRef fileSize = (CFNumberRef)CFDictionaryGetValue(dict, kCGImagePropertyFileSize);
    NSString *size=[NSString stringWithFormat:@"%@",fileSize];
    NSInteger number=[size integerValue];
    return number;
}

- (NSString*)fileType
{
    CFStringRef fileDp = CGImageSourceGetType(imageRef);
    CFStringRef fileType = CFCopyDescription(fileDp);
    NSString *typeRef = (__bridge NSString*)fileType;
    CFRelease(fileType);
    return typeRef;
}


@end
