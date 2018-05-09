//
//  LCConstants.m
//  LCTechnology
//
//  Created by wff on 2018/3/13.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCConstants.h"

/**
 */
#ifdef DEBUG
NSString *const LCBaseUrl = @"https://baidu.com/debug";
#else
NSString *const LCBaseUrl = @"https://baidu.com/relase";
#endif

/**登录*/
NSString *const LCLoginUrl = @"api/login";
