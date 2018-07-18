//
//  LCConstants.m
//  LCTechnology
//
//  Created by mf on 2018/3/13.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCApiConsts.h"

/**IP*/
#ifdef DEBUG
NSString *const LCUrlBase = @"http://192.168.3.128/erp-tp/";
#else
NSString *const LCUrlBase = @"";
#endif

/**目录*/
NSString *const LCUrlIndexHome = @"index.php/home/";

/**登录*/
NSString *const LCUrlLogin = @"login/login";
