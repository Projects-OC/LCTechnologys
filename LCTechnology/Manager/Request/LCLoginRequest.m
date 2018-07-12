//
//  LCLoginRequest.m
//  LCTechnology
//
//  Created by mf on 2018/5/9.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCLoginRequest.h"

@implementation LCLoginRequest

+ (LCLoginRequest *)loginWithUserName:(NSString *)userName
                             passWord:(NSString *)passWord{
    LCLoginRequest *request = [[LCLoginRequest alloc] initPOSTWithRequestUrl:LCLoginUrl];
    [request.paramsDic setValue:userName forKey:NSStringFromSelector(@selector(userName))];
    [request.paramsDic setValue:passWord forKey:NSStringFromSelector(@selector(password))];
    return request;
}

@end
