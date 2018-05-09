//
//  LCBaseRequestModel.h
//  LCTechnology
//
//  Created by Mac on 2018/4/10.
//  Copyright © 2018年 lc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LCBaseRequest;

@interface LCBaseRequestModel : NSObject

/**
 返回内容
 */
@property (nonatomic, copy) id data;

/**
 信息
 */
@property (nonatomic, copy) NSString * message;

/**
 状态码
 */
@property (nonatomic, copy) NSString * status;

/**
 网络请求类
 */
@property (nonatomic ,strong) LCBaseRequest *request;

@end
