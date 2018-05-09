//
//  LCBaseRequest.m
//  LCTechnology
//
//  Created by Mac on 2018/4/10.
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

-(instancetype)initWithMethod:(YTKRequestMethod)requestMethod
                   requestUrl:(NSString *)requestUrl{
    if (self = [super init]) {
        self.RequestMethodType = requestMethod;
        self.requestUrlStr = requestUrl;
        self.paramsDic = [NSMutableDictionary dictionary];
    }
    return self;
}

-(NSTimeInterval)requestTimeoutInterval{
    return 30;
}

- (NSString *)baseUrl{
    if ([self.requestBaseUrl isNotBlank]) {
        return self.requestBaseUrl;
    }
    return LCBaseUrl;
}

- (YTKRequestMethod)requestMethod{
    return self.RequestMethodType;
}

-(NSString *)requestUrl{
    return self.requestUrlStr;
}

-(id)requestArgument{
    return self.paramsDic;
}

- (void)requestWithSuccess:(void(^)(LCBaseRequestModel *baseModel))success
                   failure:(void(^)(LCBaseRequestModel *failure))failure{
    [self startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request){
         LCBaseRequestModel * baseModel = [LCBaseRequestModel modelWithJSON:request.responseJSONObject];
         baseModel.request = request;
         if ([baseModel.status isEqualToString:@"10000"]) {
             !success?:success(baseModel);
         }else{
             !failure?:failure(baseModel);
         }
     }failure:^(__kindof YTKBaseRequest * _Nonnull request){
         LCBaseRequestModel *baseModel = [[LCBaseRequestModel alloc]init];
         baseModel.message = @"";
         baseModel.status = @(request.response.statusCode).stringValue;
         baseModel.request = request;
         !failure?:failure(baseModel);
     }];
}

@end
