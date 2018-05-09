//
//  LCBaseRequest.h
//  LCTechnology
//
//  Created by Mac on 2018/4/10.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "YTKRequest.h"
@class LCBaseRequestModel;

@interface LCBaseRequest : YTKRequest

/**
 参数
 */
@property (nonatomic,strong) NSMutableDictionary *paramsDic;

/**
 url
 */
@property (nonatomic,copy) NSString *requestBaseUrl;

/**
 post请求
 */
- (instancetype)initPOSTWithRequestUrl:(NSString *)requestUrl;

/**
 get请求
 */
- (instancetype)initGETWithRequestUrl:(NSString *)requestUrl;

/**
 自选请求类型
 */
-(instancetype)initWithMethod:(YTKRequestMethod)requestMethod
                   requestUrl:(NSString *)requestUrl;

/**
 开始请求
 */
- (void)requestWithSuccess:(void(^)(LCBaseRequestModel *baseModel))success
                   failure:(void(^)(LCBaseRequestModel *failure))failure;

@end
