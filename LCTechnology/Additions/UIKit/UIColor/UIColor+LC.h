//
//  UIColor+LC.h
//  LCTechnology
//
//  Created by mf on 2018/6/20.
//  Copyright © 2018年 lc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LC)

/**
 资源文件中的色值,颜色要16进制
 */
+ (UIColor *)assetColorName:(NSString *)name;


@end
