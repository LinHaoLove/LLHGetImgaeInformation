//
//  ViewController.m
//  GetInformationFromPhoto
//
//  Created by jit-mac on 16/8/30.
//  Copyright © 2016年 LLH. All rights reserved.
//

#import "ViewController.h"
#import "LLHGetImageInfoManager.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initUI];
}
-(void)initUI{
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"读取信息并打印" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blackColor]];
    [button setFrame:CGRectMake(50, 100, self.view.bounds.size.width-100, 50)];
    [button addTarget:self action:@selector(getMeeage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    

    
    
}
-(void)getMeeage:(UIButton *)button{
    NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:@"IMG_0002" withExtension:@"JPG"];
    
    LLHGetImageInfoManager * imageInfo = [[LLHGetImageInfoManager alloc]initWithURL:fileUrl];
    
    NSLog(@"\n照片Exif信息<==>\n%@",imageInfo.imageExifDictionary);
    NSLog(@"\n照片Tiff信息<==>\n%@",imageInfo.imageTiffDictionary);
    NSLog(@"\n照片所有信息%@",imageInfo.imageProperty);
    NSLog(@"\n照片Size<==>%ld",(long)imageInfo.imageFileSize);
    NSLog(@"\n照片Type<==>%@",imageInfo.imageFileType);
    
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
