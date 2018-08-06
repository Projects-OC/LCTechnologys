//
//  LCBaseRequest.h
//  LCTechnology
//
//  Created by mf on 2018/4/10.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "YTKRequest.h"
@class LCBaseRequestModel;

@interface LCBaseRequest : YTKRequest

/**参数*/
@property (nonatomic,strong) NSMutableDictionary *paramsDic;

/**请求序列化器类型*/
@property (nonatomic,assign) YTKRequestSerializerType serializerType;

/**是否先从缓存中读取数据，新数据请求完成，再替换*/
@property (nonatomic,assign) BOOL isCache;

/** url*/
@property (nonatomic,copy) NSString *requestBaseUrl;

/**post*/
- (instancetype)initPOSTWithRequestUrl:(NSString *)requestUrl;

/**get*/
- (instancetype)initGETWithRequestUrl:(NSString *)requestUrl;

/**自选请求类型*/
-(instancetype)initWithMethod:(YTKRequestMethod)requestMethod
                   requestUrl:(NSString *)requestUrl;

/**开始请求*/
- (void)requestWithSuccess:(void(^)(LCBaseRequestModel *baseModel,id responseJSONObject))success
                   failure:(void(^)(LCBaseRequestModel *baseModel))failure;

@end
