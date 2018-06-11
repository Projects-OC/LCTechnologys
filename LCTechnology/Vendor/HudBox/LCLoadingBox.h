//
//  CTLoadingHUD.h
//  app
//
//  Created by gn_macMini_liao on 16/5/31.
//  Copyright © 2016年 KZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCHudBox.h"

@interface LCLoadingBox : LCHudBox


/**
 锁屏的加载框

 @param message 提示信息
 */
+ (void)showLoadingBoxWithMessage:(NSString *)message;


/**
 隐藏加载框
 */
+ (void)hideLoadingBox;

@end
