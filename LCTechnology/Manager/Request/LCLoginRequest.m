//
//  LCLoginRequest.m
//  LCTechnology
//
//  Created by Mac on 2018/5/9.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCLoginRequest.h"

@implementation LCLoginRequest

+ (LCLoginRequest *)loginWithUserName:(NSString *)userName
                             passWord:(NSString *)passWord{
    LCLoginRequest *request = [[LCLoginRequest alloc] initPOSTWithRequestUrl:LCLoginUrl];
    [request.paramsDic setValue:userName forKey:@"userName"];
    [request.paramsDic setValue:passWord forKey:@"passWord"];
    return request;
}

@end
