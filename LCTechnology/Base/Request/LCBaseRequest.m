//
//  LCBaseRequest.m
//  LCTechnology
//
//  Created by mf on 2018/4/10.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCBaseRequest.h"
#import "LCBaseRequestModel.h"

@interface LCBaseRequest ()

@property (nonatomic,assign) YTKRequestMethod  RequestMethodType;

@property (nonatomic,copy) NSString * requestUrlStr;

@end

@implementation LCBaseRequest


- (instancetype)initPOSTWithRequestUrl:(NSString *)requestUrl{
    return [self initWithMethod:YTKRequestMethodPOST
                     requestUrl:requestUrl];
}

- (instancetype)initGETWithRequestUrl:(NSString *)requestUrl{
    return [self initWithMethod:YTKRequestMethodGET
                     requestUrl:requestUrl];
}

- (instancetype)initWithMethod:(YTKRequestMethod)requestMethod
                    requestUrl:(NSString *)requestUrl{
    if (self = [super init]) {
        self.RequestMethodType = requestMethod;
        self.requestUrlStr = requestUrl;
        self.paramsDic = [NSMutableDictionary dictionary];
    }
    return self;
}

- (NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary{
    if ([LCAppConfig sharedConfig].access_token) {
        return @{@"X-Token" : [LCAppConfig sharedConfig].access_token};
    }
    return nil;
}

- (NSTimeInterval)requestTimeoutInterval{
    return 30;
}

/**
 返回一个大于等于 0 的值，开启缓存
 */
- (NSInteger)cacheTimeInSeconds {
    if (self.isCache) {
        return NSIntegerMax;
    }
    return 0;
}

- (NSString *)baseUrl{
    if ([self.requestBaseUrl isNotBlank]) {
        return self.requestBaseUrl;
    }
    return [LCUrlBase stringByAppendingString:LCUrlIndexHome];
}

- (YTKRequestMethod)requestMethod{
    return self.RequestMethodType;
}

- (NSString *)requestUrl{
    return self.requestUrlStr;
}

- (YTKRequestSerializerType)requestSerializerType {
    return self.serializerType;
}

- (id)requestArgument{
    return self.paramsDic;
}

- (void)requestWithSuccess:(void(^)(LCBaseRequestModel *baseModel,id responseJSONObject))success
                   failure:(void(^)(LCBaseRequestModel *baseModel))failure{
    //先读取缓存数据
    if ([self loadCacheWithError:nil] && self.isCache) {
        LCBaseRequestModel *baseModel = [LCBaseRequestModel modelWithJSON:self.responseJSONObject];
        !success?:success(baseModel,self.responseJSONObject);
    }
    [self startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request){
        LCLog(@"%@",request);
        LCBaseRequestModel *baseModel = [LCBaseRequestModel modelWithJSON:request.responseJSONObject];
        if (baseModel.code == 200) {
            !success?:success(baseModel,request.responseJSONObject);
        }else{
            !failure?:failure(baseModel);
        }
    }failure:^(__kindof YTKBaseRequest * _Nonnull request){
      
    }];
}

@end
