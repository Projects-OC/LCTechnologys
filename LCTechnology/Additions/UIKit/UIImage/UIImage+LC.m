//
//  UIImage+LC.m
//  LCTechnology
//
//  Created by mf on 2018/4/17.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "UIImage+LC.h"

@implementation UIImage (LC)

+ (UIImage *)reSizeImage:(UIImage *)image reSize:(CGSize)reSize{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [reSizeImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

/**
 改变图片资源颜色
 _imageView2.image = [[UIImage imageNamed:@"test"] imageForThemeColor:[UIColor redColor]];
 
 @param color 颜色
 */
- (UIImage *)imageForThemeColor:(UIColor *)color {
    return [self imageForThemeColor:color blendMode:kCGBlendModeOverlay];
}

- (UIImage *)imageForThemeColor:(UIColor *)color blendMode:(CGBlendMode)blendMode {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    [color setFill];
    CGRect bounds = CGRectMake(0, 0, self .size .width, self .size.height);
    UIRectFill(bounds);
    [self drawInRect :bounds blendMode :blendMode alpha:1.0];
    if (blendMode != kCGBlendModeDestinationIn) {
        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0];
    }
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


@end
