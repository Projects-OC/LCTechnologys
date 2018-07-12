//
//  LCBaseTableViewController.h
//  LCTechnology
//
//  Created by mf on 2018/4/10.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCBaseViewController.h"
#import "LCBaseTableView.h"
@class LCBaseRequest;
@class LCBaseRequestModel;

@interface LCBaseTableViewController : LCBaseViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *datas;

@property(nonatomic,weak)LCBaseTableView *plainTableView;
@property(nonatomic,weak)LCBaseTableView *groupTableView;

/**
 模型数据处理
 
 @param modelData 模型数组
 @param baseModel 模型基类
 */
- (void)pageModelData:(NSMutableArray *)modelData
            baseModel:(LCBaseRequestModel *)baseModel;

/**
 页面是否需要加载loading
 */
- (void)pageLoading;

/**
 页面请求数据失败
 
 @param message 提示信息
 */
- (void)pageFailrueWithMessage:(NSString *)message;

/**
 下拉刷新
 */
- (void)tableViewHeaderRefreshBlock:(void (^)(void))headerRefreshBlock;

/**
 上拉加载
 */
- (void)tableViewFooterRefreshBlock:(void (^)(void))footerRefreshBlock;

/**
 开始下拉刷新
 */
- (void)tableViewHeaderBeginRefreshing;

/**
 停止刷新
 */
- (void)tableViewEndRefreshing;

@end
