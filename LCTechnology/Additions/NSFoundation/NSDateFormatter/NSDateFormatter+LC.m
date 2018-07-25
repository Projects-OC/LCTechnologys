//
//  NSDateFormatter+LC.m
//  LCTechnology
//
//  Created by mf on 2018/7/25.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "NSDateFormatter+LC.h"

@implementation NSDateFormatter (LC)

+ (NSDateFormatter *)dateFormatter {
    static NSDateFormatter *dateFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    });
    return dateFormatter;
}

@end
