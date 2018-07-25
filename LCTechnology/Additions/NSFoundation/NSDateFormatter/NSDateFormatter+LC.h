//
//  NSDateFormatter+LC.h
//  LCTechnology
//
//  Created by mf on 2018/7/25.
//  Copyright © 2018年 lc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (LC)

/**
 高开销的全局单例
 */
+ (NSDateFormatter *)dateFormatter;

@end
