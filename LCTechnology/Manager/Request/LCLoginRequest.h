//
//  LCLoginRequest.h
//  LCTechnology
//
//  Created by Mac on 2018/5/9.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCBaseRequest.h"

@interface LCLoginRequest : LCBaseRequest


/**
 登录

 @param userName 用户名
 @param passWord 密码
 */
+ (LCLoginRequest *)loginWithUserName:(NSString *)userName
                             passWord:(NSString *)passWord;

@end
