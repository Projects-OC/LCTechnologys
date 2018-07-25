//
//  NSString+LC.h
//  LCTechnology
//
//  Created by mf on 2018/4/18.
//  Copyright © 2018年 lc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LC)

/**
 计算字符串 宽度 高度
 */
- (CGSize)widthWithFont:(UIFont *)font
       constrainedToSize:(CGSize)size;

/**
 手机号码验证
 */
- (BOOL)isValidTelephone;

/**
 NSDate 转 NSString
 */
+ (NSString *)stringFromDate:(NSDate *)date;

/**
 NSString 转 NSDate
 */
+ (NSDate *)dateFromString:(NSString *)string;

/**
 获取当前时间
 */
+ (NSString *)getCurrentTimes;

/**
 获取当前时间 时间戳
 */
+ (NSString *)getCurrentTimestamp;

/**
 小版本号
 */
+ (NSString *)buildString;

/**
 大版本号
 */
+ (NSString *)versionString;

@end
