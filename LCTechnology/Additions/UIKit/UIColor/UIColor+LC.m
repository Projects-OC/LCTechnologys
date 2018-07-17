//
//  UIColor+LC.m
//  LCTechnology
//
//  Created by mf on 2018/6/20.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "UIColor+LC.h"

@implementation UIColor (LC)

+ (UIColor *)assetColorName:(NSString *)name{
    if (name.length == 0) {
        return [UIColor clearColor];
    }
    
    NSString *cString = [[name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if (cString.length != 6) {
        return [UIColor clearColor];
    }
    
    if (@available(iOS 11.0, *)) {
        return [UIColor colorNamed:name];
    } else {
        return [self mtColorWithHexString:name];
    }
}

+ (UIColor *)mtColorWithHexString:(NSString *)color{
    unsigned int r, g, b;
    [[NSScanner scannerWithString:[color substringWithRange:NSMakeRange(0, 2)]] scanHexInt:&r];
    [[NSScanner scannerWithString:[color substringWithRange:NSMakeRange(2, 2)]] scanHexInt:&g];
    [[NSScanner scannerWithString:[color substringWithRange:NSMakeRange(4, 2)]] scanHexInt:&b];
    
    return [UIColor colorWithRed:((CGFloat) r / 255.0f) green:((CGFloat) g / 255.0f) blue:((CGFloat) b / 255.0f) alpha:1.0f];
}


@end
