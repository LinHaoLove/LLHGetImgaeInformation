# LLHGetImgaeInformation
采用 iOS 偏底层的ImageIO,获取照片信息(照片地理位置,拍照时间,拍照机型,机型品牌,机型操作系统,曝光光圈,照片大小,照片种类,照片色彩种类等等)


郑重申明:本项目只用于学习交流,为iOS开发提供便利,不可用作非法获取或搜集用户信息,不得违背中华人民共和国现有法律法典.

使用说明:
		
		1,将LLHGetImageInfoManager文件夹导入项目.
		
		2,导入头文件:#import "LLHGetImageInfoManager.h"
		
		3,
		
		-(void)getMeeage:(UIButton *)button{
    			NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:@"IMG_0002" withExtension:@"JPG"];
    			LLHGetImageInfoManager * imageInfo = [[LLHGetImageInfoManager alloc]initWithURL:fileUrl];
    			NSLog(@"\n照片Exif信息<==>\n%@",imageInfo.imageExifDictionary);
    			NSLog(@"\n照片Tiff信息<==>\n%@",imageInfo.imageTiffDictionary);
    			NSLog(@"\n照片所有信息%@",imageInfo.imageProperty);
    			NSLog(@"\n照片Size<==>%ld",(long)imageInfo.imageFileSize);
    			NSLog(@"\n照片Type<==>%@",imageInfo.imageFileType);
			}
			
部分信息示例:





