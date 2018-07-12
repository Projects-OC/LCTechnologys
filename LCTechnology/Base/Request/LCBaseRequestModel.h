//
//  LCBaseRequestModel.h
//  LCTechnology
//
//  Created by mf on 2018/4/10.
//  Copyright © 2018年 lc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCBaseRequestModel : NSObject

/**
 返回内容
 */
@property (nonatomic,copy) id data;

/**
 信息
 */
@property (nonatomic,copy) NSString *message;

/**
 状态码
 */
@property (nonatomic,assign) NSInteger code;

/**
 每页总条数
 */
@property (nonatomic,assign) NSInteger total;

/**
 总页数
 */
@property (nonatomic,assign) NSInteger total_page;

@end
