//
//  NSString+LC.m
//  LCTechnology
//
//  Created by Mac on 2018/4/18.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "NSString+LC.h"

@implementation NSString (LC)

- (CGSize)widthWithFont:(UIFont *)font
     constrainedToSize:(CGSize)size{
    UIFont *textFont = font ? font : [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName: textFont,
                                 NSParagraphStyleAttributeName: paragraph};
    CGSize textSize = [self boundingRectWithSize:size
                                  options:(NSStringDrawingUsesLineFragmentOrigin |
                                           NSStringDrawingTruncatesLastVisibleLine)
                               attributes:attributes
                                  context:nil].size;
    return textSize;
//    return ceil(textSize.width);
}

- (BOOL)isValidTelephone{
    //手机号开头：13 14 15 16 17 18，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(14[0-9])|(16[0-9])|(15[0-9])|(18[0-9])|(17[0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

+ (NSString *)stringFromDate:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formatter stringFromDate:date];
}

+ (NSDate *)dateFromString:(NSString *)string{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formatter dateFromString:string];
}

+ (NSString*)getCurrentTimes{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
}

+ (NSString*)getCurrentTimestamp{
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval timeInterval = [date timeIntervalSince1970];
    NSString* timeString = [NSString stringWithFormat:@"%0.f",timeInterval];//转为字符型
    timeString = [timeString stringByAppendingString:@"000"];//java13位
    return timeString;
}

@end
