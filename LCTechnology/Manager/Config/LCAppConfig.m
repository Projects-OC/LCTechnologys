//
//  LCAppConfig.m
//  LCTechnology
//
//  Created by mf on 2018/5/9.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCAppConfig.h"

@implementation LCAppConfig

+ (LCAppConfig *)sharedConfig{
    static LCAppConfig* config = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[self alloc]init];
    });
    return config;
}

static NSString *LCLoginKey = @"LCLoginKey";
- (void)setLogined:(BOOL)logined{

}

-(BOOL)isLogined{
    return YES;
}

@end
