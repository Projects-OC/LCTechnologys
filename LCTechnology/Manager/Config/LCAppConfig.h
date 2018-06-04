//
//  LCAppConfig.h
//  LCTechnology
//
//  Created by Mac on 2018/5/9.
//  Copyright © 2018年 lc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCAppConfig : NSObject

+ (LCAppConfig *)sharedConfig;

/**
 是否登录
 */
@property (nonatomic,readwrite,assign,getter=isLogined) BOOL logined;


/** 账户 */
@property (nonatomic,copy) NSString *account;
/** token */
@property (nonatomic,copy) NSString *access_token;

@end
